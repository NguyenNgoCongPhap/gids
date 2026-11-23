//// Trusted source-choice handle mirror; Rust owns validation and lookup policy.

import gleam/order
import gleam/string

// reason: this brand differs from SavedRunId because a source choice is not a saved results run.
/// Nonsecret opaque lookup handle naming a source choice.
/// It is not a process ID, credential, liveness proof or native IDEA identity.
pub opaque type SourceTargetId {
  SourceTargetId(value: String)
}

/// Wrap every trusted wire string unchanged, including malformed or empty text.
/// Rust validates GUID form before this seam; no validation is performed here.
pub fn from_wire(value: String) -> SourceTargetId {
  SourceTargetId(value)
}

/// Return the exact wire text without normalization or a host lookup.
pub fn value(id: SourceTargetId) -> String {
  id.value
}

/// Case-sensitive lexical order of wire text, without interpreting source identity.
pub fn compare(a: SourceTargetId, b: SourceTargetId) -> order.Order {
  string.compare(a.value, b.value)
}
