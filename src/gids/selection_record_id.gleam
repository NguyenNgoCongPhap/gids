// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// One captured selection in the selection history, recent or saved.
/// Its GUID is minted by struct-crypto and validated by the Rust boundary.
/// The Rust boundary stores it as lower-case 8-4-4-4-12 text.
pub opaque type SelectionRecordId {
  SelectionRecordId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> SelectionRecordId {
  SelectionRecordId(value)
}

pub fn value(id: SelectionRecordId) -> String {
  id.value
}

pub fn compare(a: SelectionRecordId, b: SelectionRecordId) -> order.Order {
  string.compare(a.value, b.value)
}
