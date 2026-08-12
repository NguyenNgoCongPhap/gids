// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type ParameterName {
  ParameterName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> ParameterName {
  ParameterName(value)
}

pub fn value(id: ParameterName) -> String {
  id.value
}

pub fn compare(a: ParameterName, b: ParameterName) -> order.Order {
  string.compare(a.value, b.value)
}
