// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

pub opaque type ModeIndex {
  ModeIndex(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> ModeIndex {
  ModeIndex(value)
}

pub fn value(id: ModeIndex) -> Int {
  id.value
}

pub fn compare(a: ModeIndex, b: ModeIndex) -> order.Order {
  int.compare(a.value, b.value)
}
