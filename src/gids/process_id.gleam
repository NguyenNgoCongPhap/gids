// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gleam/int
import gleam/order

/// Operating-system process id of a running host. It names a process only
/// while that process runs; the operating system reuses it afterwards.
pub opaque type ProcessId {
  ProcessId(value: Int)
}

/// Wire-trusted; the Rust boundary is the validator.
pub fn from_wire(value: Int) -> ProcessId {
  ProcessId(value)
}

pub fn value(id: ProcessId) -> Int {
  id.value
}

pub fn compare(a: ProcessId, b: ProcessId) -> order.Order {
  int.compare(a.value, b.value)
}
