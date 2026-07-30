// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type LoadCaseId {
  LoadCaseId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> LoadCaseId {
  LoadCaseId(value)
}

pub fn value(id: LoadCaseId) -> Int {
  id.value
}

pub fn compare(a: LoadCaseId, b: LoadCaseId) -> order.Order {
  int.compare(a.value, b.value)
}
