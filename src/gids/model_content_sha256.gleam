// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// Model-content SHA-256 supplied as validated lowercase text by Rust.
/// Wire-trusted: validation belongs to the Rust boundary.
pub opaque type ModelContentSha256 {
  ModelContentSha256(value: String)
}

/// Rewrap Rust-validated wire text without changing case or normalizing it.
pub fn from_wire(value: String) -> ModelContentSha256 {
  ModelContentSha256(value)
}

/// Return exactly the wire text carried by this brand.
pub fn value(id: ModelContentSha256) -> String {
  id.value
}

/// Compare the carried text lexically; this does not imply geometric identity.
pub fn compare(a: ModelContentSha256, b: ModelContentSha256) -> order.Order {
  string.compare(a.value, b.value)
}
