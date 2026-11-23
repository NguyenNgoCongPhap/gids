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
one generated catalog row per brand (48 total). Land core before these mirrors;
generated consumers require both revisions. Existing brands are unchanged.

## Source-choice and capture handle mirrors

Contract: `feat.ids.source-target.v1`, completed. Inputs are trusted wire strings
whose GUID validity is owned by Rust. The outputs are distinct `SourceTargetId`
and `SourceCaptureId` types in `gids/source_target_id` and
`gids/source_capture_id`, using the existing `from_wire`, `value` and `compare`
operations and structural equality. Equal underlying text never makes the two
nominal types interchangeable.

These nonsecret opaque lookup handles identify a source choice and the exact
displayed IFC or analysis-controller capture, respectively. The capture handle
binds preparation and execution to that displayed capture, rather than merely
the same process or member keys; the owning Rust workflow enforces that binding.
Neither handle is a process ID, credential, liveness proof or native IDEA
identity. Gids never parses, mints, normalizes or refreshes them. Rewrapping
trusted text is total, including malformed or empty text; invalid GUID input is
refused by the Rust boundary before the trusted wire seam.

Acceptance covers exact round-trip, distinctness, case-sensitive equality,
lexical ordering, the malformed-trusted-input controls and one generated catalog
row per new type. Existing brands and their APIs are unchanged.
