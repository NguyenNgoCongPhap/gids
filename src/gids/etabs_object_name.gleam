// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type EtabsObjectName {
  EtabsObjectName(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> EtabsObjectName {
  EtabsObjectName(value)
}

pub fn value(id: EtabsObjectName) -> String {
  id.value
}

pub fn compare(a: EtabsObjectName, b: EtabsObjectName) -> order.Order {
  string.compare(a.value, b.value)
}
