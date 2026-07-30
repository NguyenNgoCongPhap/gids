// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type MemberId {
  MemberId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> MemberId {
  MemberId(value)
}

pub fn value(id: MemberId) -> Int {
  id.value
}

pub fn compare(a: MemberId, b: MemberId) -> order.Order {
  int.compare(a.value, b.value)
}
