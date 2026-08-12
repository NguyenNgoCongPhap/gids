// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type FrameId {
  FrameId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> FrameId {
  FrameId(value)
}

pub fn value(id: FrameId) -> String {
  id.value
}

pub fn compare(a: FrameId, b: FrameId) -> order.Order {
  string.compare(a.value, b.value)
}
