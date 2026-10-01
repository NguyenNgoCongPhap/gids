// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type ViewOptionPresetId {
  ViewOptionPresetId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> ViewOptionPresetId {
  ViewOptionPresetId(value)
}

pub fn value(id: ViewOptionPresetId) -> String {
  id.value
}

pub fn compare(a: ViewOptionPresetId, b: ViewOptionPresetId) -> order.Order {
  string.compare(a.value, b.value)
}
