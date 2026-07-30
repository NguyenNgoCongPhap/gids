// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type MaterialId {
  MaterialId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> MaterialId {
  MaterialId(value)
}

pub fn value(id: MaterialId) -> String {
  id.value
}

pub fn compare(a: MaterialId, b: MaterialId) -> order.Order {
  string.compare(a.value, b.value)
}
