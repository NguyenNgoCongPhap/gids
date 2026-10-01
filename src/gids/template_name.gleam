// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type TemplateName {
  TemplateName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> TemplateName {
  TemplateName(value)
}

pub fn value(id: TemplateName) -> String {
  id.value
}

pub fn compare(a: TemplateName, b: TemplateName) -> order.Order {
  string.compare(a.value, b.value)
}
