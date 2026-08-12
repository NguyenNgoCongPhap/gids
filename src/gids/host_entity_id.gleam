// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type HostEntityId {
  HostEntityId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> HostEntityId {
  HostEntityId(value)
}

pub fn value(id: HostEntityId) -> String {
  id.value
}

pub fn compare(a: HostEntityId, b: HostEntityId) -> order.Order {
  string.compare(a.value, b.value)
}
