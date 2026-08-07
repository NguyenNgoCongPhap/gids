# gids

**Owns:** Opaque brands for structural entity identifiers crossing typed wire
DTOs into Gleam, with one module per brand. IDs are wire-trusted; the Rust
boundary validates them.

**Refuses:** Physical quantities (`gunit` owns those), validation or parsing
policy, and app-local ID types. Add missing ID brands here.

Browse the available brands in [the generated catalog](docs/CATALOG.md).
