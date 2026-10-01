// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type StoryName {
  StoryName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> StoryName {
  StoryName(value)
}

pub fn value(id: StoryName) -> String {
  id.value
}

pub fn compare(a: StoryName, b: StoryName) -> order.Order {
  string.compare(a.value, b.value)
}
