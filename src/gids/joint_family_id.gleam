// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type JointFamilyId {
  JointFamilyId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> JointFamilyId {
  JointFamilyId(value)
}

pub fn value(id: JointFamilyId) -> String {
  id.value
}

pub fn compare(a: JointFamilyId, b: JointFamilyId) -> order.Order {
  string.compare(a.value, b.value)
}
