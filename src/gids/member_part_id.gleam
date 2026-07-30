// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type MemberPartId {
  MemberPartId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> MemberPartId {
  MemberPartId(value)
}

pub fn value(id: MemberPartId) -> Int {
  id.value
}

pub fn compare(a: MemberPartId, b: MemberPartId) -> order.Order {
  int.compare(a.value, b.value)
}
