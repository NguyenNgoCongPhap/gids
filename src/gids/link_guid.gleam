// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// GUID of a host link object, stable across renames where `LinkName` is
/// not. The Rust boundary stores it as lower-case 8-4-4-4-12 text.
pub opaque type LinkGuid {
  LinkGuid(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> LinkGuid {
  LinkGuid(value)
}

pub fn value(id: LinkGuid) -> String {
  id.value
}

pub fn compare(a: LinkGuid, b: LinkGuid) -> order.Order {
  string.compare(a.value, b.value)
}
