// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// GUID of a host frame object, stable across renames where `FrameName` is
/// not. The Rust boundary stores it as lower-case 8-4-4-4-12 text.
pub opaque type FrameGuid {
  FrameGuid(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> FrameGuid {
  FrameGuid(value)
}

pub fn value(id: FrameGuid) -> String {
  id.value
}

pub fn compare(a: FrameGuid, b: FrameGuid) -> order.Order {
  string.compare(a.value, b.value)
}
