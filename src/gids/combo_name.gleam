// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type ComboName {
  ComboName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> ComboName {
  ComboName(value)
}

pub fn value(id: ComboName) -> String {
  id.value
}

pub fn compare(a: ComboName, b: ComboName) -> order.Order {
  string.compare(a.value, b.value)
}
