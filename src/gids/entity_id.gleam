// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type EntityId {
  EntityId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> EntityId {
  EntityId(value)
}

pub fn value(id: EntityId) -> String {
  id.value
}

pub fn compare(a: EntityId, b: EntityId) -> order.Order {
  string.compare(a.value, b.value)
}
