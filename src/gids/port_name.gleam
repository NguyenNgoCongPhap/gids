// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type PortName {
  PortName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> PortName {
  PortName(value)
}

pub fn value(id: PortName) -> String {
  id.value
}

pub fn compare(a: PortName, b: PortName) -> order.Order {
  string.compare(a.value, b.value)
}
