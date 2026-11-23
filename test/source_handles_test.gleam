//// Covers exact source-handle wire mirrors, lexical order and malformed trusted input.

import gids/source_capture_id
import gids/source_target_id
import gleam/list
import gleam/order
import gleam/string
import gleeunit/should

// reason: wire_values supplies shared valid handle inputs without assigning either nominal identity.
fn wire_values() -> #(String, String) {
  let prefix = "01234567" <> "-89ab-4cde-8fab-" <> "0123456789a"
  #(prefix <> "1", prefix <> "2")
}

// reason: round_trip_contract extends the existing leaf tests to both source-handle brands without duplicating assertions.
fn round_trip_contract(from_wire: fn(String) -> id, value: fn(id) -> String) {
  let #(first_wire, second_wire) = wire_values()
  let first = from_wire(first_wire)
  value(first) |> should.equal(first_wire)
  should.be_true(first == from_wire(first_wire))
  should.be_false(first == from_wire(second_wire))
  let upper = string.uppercase(first_wire)
  value(from_wire(upper)) |> should.equal(upper)
  should.be_false(first == from_wire(upper))
}

// reason: ordering_contract checks the common trusted-string order while keeping each nominal API distinct.
fn ordering_contract(
  from_wire: fn(String) -> id,
  compare: fn(id, id) -> order.Order,
) {
  let #(first_wire, second_wire) = wire_values()
  let first = from_wire(first_wire)
  let second = from_wire(second_wire)
  compare(first, second) |> should.equal(order.Lt)
  compare(first, from_wire(first_wire)) |> should.equal(order.Eq)
  compare(second, first) |> should.equal(order.Gt)
  compare(from_wire("A"), from_wire("a")) |> should.equal(order.Lt)
}

// reason: trusted_text_contract checks that neither source brand takes over Rust's validation or normalization.
fn trusted_text_contract(from_wire: fn(String) -> id, value: fn(id) -> String) {
  list.each(["", " not-a-guid ", "UPPERCASE-invalid-handle\r\n"], fn(text) {
    text |> from_wire |> value |> should.equal(text)
  })
}

pub fn source_target_round_trip_and_distinct_identity_test() {
  round_trip_contract(source_target_id.from_wire, source_target_id.value)
}

pub fn source_capture_round_trip_and_distinct_identity_test() {
  round_trip_contract(source_capture_id.from_wire, source_capture_id.value)
}

pub fn source_target_lexical_order_test() {
  ordering_contract(source_target_id.from_wire, source_target_id.compare)
}

pub fn source_capture_lexical_order_test() {
  ordering_contract(source_capture_id.from_wire, source_capture_id.compare)
}

pub fn source_target_preserves_malformed_trusted_text_test() {
  trusted_text_contract(source_target_id.from_wire, source_target_id.value)
}

pub fn source_capture_preserves_malformed_trusted_text_test() {
  trusted_text_contract(source_capture_id.from_wire, source_capture_id.value)
}
