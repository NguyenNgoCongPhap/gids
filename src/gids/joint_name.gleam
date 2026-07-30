// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type JointName {
  JointName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> JointName {
  JointName(value)
}

pub fn value(id: JointName) -> String {
  id.value
}

pub fn compare(a: JointName, b: JointName) -> order.Order {
  string.compare(a.value, b.value)
}
