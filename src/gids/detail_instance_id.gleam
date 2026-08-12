// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type DetailInstanceId {
  DetailInstanceId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> DetailInstanceId {
  DetailInstanceId(value)
}

pub fn value(id: DetailInstanceId) -> String {
  id.value
}

pub fn compare(a: DetailInstanceId, b: DetailInstanceId) -> order.Order {
  string.compare(a.value, b.value)
}
