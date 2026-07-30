// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type SectionId {
  SectionId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> SectionId {
  SectionId(value)
}

pub fn value(id: SectionId) -> String {
  id.value
}

pub fn compare(a: SectionId, b: SectionId) -> order.Order {
  string.compare(a.value, b.value)
}
