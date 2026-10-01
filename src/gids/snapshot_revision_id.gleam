// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type SnapshotRevisionId {
  SnapshotRevisionId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> SnapshotRevisionId {
  SnapshotRevisionId(value)
}

pub fn value(id: SnapshotRevisionId) -> String {
  id.value
}

pub fn compare(a: SnapshotRevisionId, b: SnapshotRevisionId) -> order.Order {
  string.compare(a.value, b.value)
}
