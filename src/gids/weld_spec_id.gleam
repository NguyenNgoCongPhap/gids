// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type WeldSpecId {
  WeldSpecId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> WeldSpecId {
  WeldSpecId(value)
}

pub fn value(id: WeldSpecId) -> String {
  id.value
}

pub fn compare(a: WeldSpecId, b: WeldSpecId) -> order.Order {
  string.compare(a.value, b.value)
}
