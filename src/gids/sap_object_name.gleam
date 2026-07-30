// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type SapObjectName {
  SapObjectName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> SapObjectName {
  SapObjectName(value)
}

pub fn value(id: SapObjectName) -> String {
  id.value
}

pub fn compare(a: SapObjectName, b: SapObjectName) -> order.Order {
  string.compare(a.value, b.value)
}
