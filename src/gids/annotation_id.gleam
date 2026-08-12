// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/order
import gleam/string

pub opaque type AnnotationId {
  AnnotationId(value: String)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: String) -> AnnotationId {
  AnnotationId(value)
}

pub fn value(id: AnnotationId) -> String {
  id.value
}

pub fn compare(a: AnnotationId, b: AnnotationId) -> order.Order {
  string.compare(a.value, b.value)
}
