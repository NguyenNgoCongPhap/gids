// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type DefinitionId {
  DefinitionId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator. It admits only the
/// `detail.<family>.<slug>.vN` grammar, which this brand does not re-check.
pub fn from_wire(value: String) -> DefinitionId {
  DefinitionId(value)
}

pub fn value(id: DefinitionId) -> String {
  id.value
}

pub fn compare(a: DefinitionId, b: DefinitionId) -> order.Order {
  string.compare(a.value, b.value)
}
