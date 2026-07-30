// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type OperationId {
  OperationId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> OperationId {
  OperationId(value)
}

pub fn value(id: OperationId) -> Int {
  id.value
}

pub fn compare(a: OperationId, b: OperationId) -> order.Order {
  int.compare(a.value, b.value)
}
