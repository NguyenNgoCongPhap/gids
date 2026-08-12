// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type BatchOperationId {
  BatchOperationId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> BatchOperationId {
  BatchOperationId(value)
}

pub fn value(id: BatchOperationId) -> String {
  id.value
}

pub fn compare(a: BatchOperationId, b: BatchOperationId) -> order.Order {
  string.compare(a.value, b.value)
}
