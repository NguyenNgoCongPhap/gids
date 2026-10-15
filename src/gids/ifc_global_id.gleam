// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

/// Case-sensitive compressed IFC GlobalId, bound to model content by the upstream record.
/// Wire-trusted: validation belongs to the Rust boundary.
pub opaque type IfcGlobalId {
  IfcGlobalId(value: String)
}

/// Rewrap Rust-validated wire text without changing case or normalizing it.
pub fn from_wire(value: String) -> IfcGlobalId {
  IfcGlobalId(value)
}

/// Return exactly the wire text carried by this brand.
pub fn value(id: IfcGlobalId) -> String {
  id.value
}

/// Compare the carried text lexically; this does not imply geometric identity.
pub fn compare(a: IfcGlobalId, b: IfcGlobalId) -> order.Order {
  string.compare(a.value, b.value)
}
