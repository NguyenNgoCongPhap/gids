// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type LoadCaseName {
  LoadCaseName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> LoadCaseName {
  LoadCaseName(value)
}

pub fn value(id: LoadCaseName) -> String {
  id.value
}

pub fn compare(a: LoadCaseName, b: LoadCaseName) -> order.Order {
  string.compare(a.value, b.value)
}
