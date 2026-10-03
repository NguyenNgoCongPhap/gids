// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// Identity of one saved analysis-results run, a GUID minted by its caller.
/// The Rust boundary stores it as lower-case 8-4-4-4-12 text.
pub opaque type SavedRunId {
  SavedRunId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> SavedRunId {
  SavedRunId(value)
}

pub fn value(id: SavedRunId) -> String {
  id.value
}

pub fn compare(a: SavedRunId, b: SavedRunId) -> order.Order {
  string.compare(a.value, b.value)
}
