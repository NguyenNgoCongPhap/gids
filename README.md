# gids

**Owns:** Opaque brands for structural entity identifiers crossing typed wire
DTOs into Gleam, with one module per brand. IDs are wire-trusted; the Rust
boundary validates them.

**Refuses:** Physical quantities (`gunit` owns those), validation or parsing
policy, and app-local ID types. Add missing ID brands here.

Browse the available brands in [the generated catalog](docs/CATALOG.md).

## IFC identity mirrors

Contract: `feat.ids.ifc-member-identity.v1`, completed. Inputs are Rust-validated
wire strings. Outputs are distinct IfcGlobalId and ModelContentSha256 brands
with exact round-trip, case-sensitive equality and lexical compare. The upstream
IfcMemberIdentity combines both leaves; ExpressId is not persistent identity.

Rust owns validation and lowercase digest normalization; these mirrors preserve
even malformed text supplied to their trusted seam. They never hash, mint IDs,
look up a model, or add parsing policy. Rewrapping is total, with no local failure.
Acceptance is round-trip/order/equality, the explicit malformed-text control and
one generated catalog row per brand (45 total). Land core before these mirrors;
generated consumers require both revisions. Existing brands are unchanged.

## Shared library instruction gate

Local standing gate: `py -3.15 scripts/check.py`.

Set `REPO_SEED` to the absolute path of a reviewed repo-seed checkout containing
`scripts/sync_agents_block.py` and `shared/agents/library-family.md`. The local
gate checks this repository's generated library-family block against that source.
Missing source or block drift refuses the gate; there is no network or sibling-path fallback.
