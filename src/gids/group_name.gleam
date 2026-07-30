// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type GroupName {
  GroupName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> GroupName {
  GroupName(value)
}

pub fn value(id: GroupName) -> String {
  id.value
}

pub fn compare(a: GroupName, b: GroupName) -> order.Order {
  string.compare(a.value, b.value)
}
