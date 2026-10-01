// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// GUID of a host point object, stable across renames where `JointName` is
/// not. The Rust boundary stores it as lower-case 8-4-4-4-12 text.
pub opaque type JointGuid {
  JointGuid(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> JointGuid {
  JointGuid(value)
}

pub fn value(id: JointGuid) -> String {
  id.value
}

pub fn compare(a: JointGuid, b: JointGuid) -> order.Order {
  string.compare(a.value, b.value)
}
