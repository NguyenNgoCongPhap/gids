// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// Name of a host link object; brand-distinct from `FrameName` and `JointName`.
pub opaque type LinkName {
  LinkName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> LinkName {
  LinkName(value)
}

pub fn value(id: LinkName) -> String {
  id.value
}

pub fn compare(a: LinkName, b: LinkName) -> order.Order {
  string.compare(a.value, b.value)
}
