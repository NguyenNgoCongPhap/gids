// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type BimAdditionName {
  BimAdditionName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> BimAdditionName {
  BimAdditionName(value)
}

pub fn value(id: BimAdditionName) -> String {
  id.value
}

pub fn compare(a: BimAdditionName, b: BimAdditionName) -> order.Order {
  string.compare(a.value, b.value)
}
