# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Cong Phap

from __future__ import annotations

import argparse
import difflib
import re
import sys
from dataclasses import dataclass
from pathlib import Path


REPOSITORY_ROOT = Path(__file__).resolve().parents[1]
SOURCE_ROOT = REPOSITORY_ROOT / "src"
BRAND_ROOT = SOURCE_ROOT / "gids"
CATALOG_PATH = REPOSITORY_ROOT / "docs" / "CATALOG.md"
OPAQUE_DECLARATION = re.compile(r"^pub opaque type\b", re.MULTILINE)
BRAND_DEFINITION = re.compile(
    r"^pub opaque type (?P<brand>[A-Z][A-Za-z0-9_]*)\s*\{\s*"
    r"(?P<constructor>[A-Z][A-Za-z0-9_]*)\s*\(\s*"
    r"(?:[a-z][A-Za-z0-9_]*\s*:\s*)?(?P<primitive>Int|String)\s*\)\s*\}",
    re.MULTILINE,
)
PUBLIC_FUNCTION = re.compile(
    r"^pub fn\s+([a-z][A-Za-z0-9_]*)\s*\(", re.MULTILINE
)


# reason: CatalogEntry is new because this repository has no catalog data model.
@dataclass(frozen=True)
class CatalogEntry:
    module: str
    brand: str
    primitive: str
    operations: tuple[str, ...]
    description: str


# reason: type_description is new because Gleam type docs need adjacency-aware parsing.
def type_description(source: str, declaration_offset: int) -> str:
    preceding_lines = source[:declaration_offset].splitlines()
    doc_lines: list[str] = []
    for line in reversed(preceding_lines):
        stripped = line.strip()
        if not stripped.startswith("///"):
            break
        doc_lines.append(stripped.removeprefix("///").strip())
    if not doc_lines:
        return "-"
    return doc_lines[-1] or "-"


# reason: parse_module is new because no existing code inventories Gleam ID brands.
def parse_module(path: Path) -> CatalogEntry:
    source = path.read_text(encoding="utf-8")
    opaque_declarations = OPAQUE_DECLARATION.findall(source)
    if len(opaque_declarations) != 1:
        raise ValueError(
            f"ERROR: {path}: expected one pub opaque type, found "
            f"{len(opaque_declarations)}"
        )
    definition = BRAND_DEFINITION.search(source)
    if definition is None:
        raise ValueError(
            f"ERROR: {path}: unsupported opaque constructor; expected one Int or "
            "String field"
        )
    operations = tuple(PUBLIC_FUNCTION.findall(source))
    module = path.relative_to(SOURCE_ROOT).with_suffix("").as_posix()
    return CatalogEntry(
        module=module,
        brand=definition.group("brand"),
        primitive=definition.group("primitive"),
        operations=operations,
        description=type_description(source, definition.start()),
    )


# reason: render_catalog is new because the committed catalog must be reproducible.
def render_catalog(entries: list[CatalogEntry]) -> str:
    lines = [
        "<!-- GENERATED — do not hand-edit; run scripts/gen_catalog.py -->",
        "",
        "# gids catalog",
        "",
        "| Module | Brand type | Primitive | Exported operations | Type doc |",
        "| --- | --- | --- | --- | --- |",
    ]
    for entry in entries:
        operations = ", ".join(f"`{name}`" for name in entry.operations) or "-"
        description = entry.description.replace("|", r"\|")
        lines.append(
            f"| `{entry.module}` | `{entry.brand}` | `{entry.primitive}` | "
            f"{operations} | {description} |"
        )
    return "\n".join(lines) + "\n"


# reason: check_catalog is new because CI needs a non-mutating byte-level drift gate.
def check_catalog(generated: bytes, row_count: int) -> int:
    if not CATALOG_PATH.exists():
        print(
            "ERROR: docs/CATALOG.md is missing (unlabeled stock or ghost label).",
            file=sys.stderr,
        )
        return 1
    committed = CATALOG_PATH.read_bytes()
    if committed == generated:
        print(f"Catalog is current: {row_count} rows.")
        return 0
    diff = difflib.unified_diff(
        committed.decode("utf-8").splitlines(),
        generated.decode("utf-8").splitlines(),
        fromfile="committed/docs/CATALOG.md",
        tofile="generated/docs/CATALOG.md",
        lineterm="",
    )
    print(
        "ERROR: docs/CATALOG.md differs from generated output "
        "(unlabeled stock or ghost label).",
        file=sys.stderr,
    )
    print("\n".join(diff), file=sys.stderr)
    return 1


# reason: main is new because generation and --check share one deterministic entry point.
def main() -> int:
    parser = argparse.ArgumentParser(description="Generate the gids brand catalog.")
    parser.add_argument(
        "--check", action="store_true", help="Fail if the committed catalog differs."
    )
    arguments = parser.parse_args()
    paths = sorted(BRAND_ROOT.glob("*.gleam"), key=lambda path: path.name)
    if not paths:
        raise ValueError(f"ERROR: no Gleam modules found under {BRAND_ROOT}")
    entries = [parse_module(path) for path in paths]
    generated = render_catalog(entries).encode("utf-8")
    if arguments.check:
        return check_catalog(generated, len(entries))
    CATALOG_PATH.parent.mkdir(parents=True, exist_ok=True)
    CATALOG_PATH.write_bytes(generated)
    print(f"Wrote docs/CATALOG.md with {len(entries)} rows.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
