// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type NodeId {
  NodeId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> NodeId {
  NodeId(value)
}

pub fn value(id: NodeId) -> Int {
  id.value
}

pub fn compare(a: NodeId, b: NodeId) -> order.Order {
  int.compare(a.value, b.value)
}
