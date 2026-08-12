// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type RenderProfileId {
  RenderProfileId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> RenderProfileId {
  RenderProfileId(value)
}

pub fn value(id: RenderProfileId) -> String {
  id.value
}

pub fn compare(a: RenderProfileId, b: RenderProfileId) -> order.Order {
  string.compare(a.value, b.value)
}
