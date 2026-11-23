//// Trusted displayed-capture handle mirror; Rust owns validation and capture binding.

import gleam/order
import gleam/string

// reason: this brand differs from SourceTargetId because a displayed capture is not a source choice.
/// Nonsecret opaque lookup handle naming the exact displayed IFC or analysis capture.
/// Rust binds preparation and execution to that capture; this brand proves no liveness or authority.
pub opaque type SourceCaptureId {
  SourceCaptureId(value: String)
}

/// Wrap every trusted wire string unchanged, including malformed or empty text.
/// Rust validates GUID form before this seam; no validation is performed here.
pub fn from_wire(value: String) -> SourceCaptureId {
  SourceCaptureId(value)
}

/// Return the exact wire text without normalization or a host lookup.
pub fn value(id: SourceCaptureId) -> String {
  id.value
}

/// Case-sensitive lexical order of wire text, without interpreting capture chronology.
pub fn compare(a: SourceCaptureId, b: SourceCaptureId) -> order.Order {
  string.compare(a.value, b.value)
}
