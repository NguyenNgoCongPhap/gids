// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type FrameName {
  FrameName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> FrameName {
  FrameName(value)
}

pub fn value(id: FrameName) -> String {
  id.value
}

pub fn compare(a: FrameName, b: FrameName) -> order.Order {
  string.compare(a.value, b.value)
}
