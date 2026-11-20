// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

/// One connection of an open connection-design project, host-numbered.
/// It is meaningful only within that open project.
pub opaque type ProjectConnectionId {
  ProjectConnectionId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> ProjectConnectionId {
  ProjectConnectionId(value)
}

pub fn value(id: ProjectConnectionId) -> Int {
  id.value
}

pub fn compare(a: ProjectConnectionId, b: ProjectConnectionId) -> order.Order {
  int.compare(a.value, b.value)
}
