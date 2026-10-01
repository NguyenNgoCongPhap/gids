// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type ViewName {
  ViewName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> ViewName {
  ViewName(value)
}

pub fn value(id: ViewName) -> String {
  id.value
}

pub fn compare(a: ViewName, b: ViewName) -> order.Order {
  string.compare(a.value, b.value)
}
