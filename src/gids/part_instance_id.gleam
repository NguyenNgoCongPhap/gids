// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type PartInstanceId {
  PartInstanceId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> PartInstanceId {
  PartInstanceId(value)
}

pub fn value(id: PartInstanceId) -> String {
  id.value
}

pub fn compare(a: PartInstanceId, b: PartInstanceId) -> order.Order {
  string.compare(a.value, b.value)
}
