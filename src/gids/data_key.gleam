// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type DataKey {
  DataKey(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> DataKey {
  DataKey(value)
}

pub fn value(id: DataKey) -> Int {
  id.value
}

pub fn compare(a: DataKey, b: DataKey) -> order.Order {
  int.compare(a.value, b.value)
}
