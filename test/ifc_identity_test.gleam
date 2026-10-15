// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gids/ifc_global_id
import gids/model_content_sha256
import gleam/order
import gleeunit/should

pub fn global_id_case_order_and_wire_round_trip_test() {
  let first = ifc_global_id.from_wire("3t3TDZl_D9NOIWB0BSjzJI")
  let equal = ifc_global_id.from_wire("3t3TDZl_D9NOIWB0BSjzJI")
  let other = ifc_global_id.from_wire("3t3TDZl_D9NOIWB0BSjzJi")
  first |> ifc_global_id.value |> should.equal("3t3TDZl_D9NOIWB0BSjzJI")
  { first == equal } |> should.be_true
  { first == other } |> should.be_false
  ifc_global_id.compare(first, other) |> should.equal(order.Lt)
  ifc_global_id.compare(other, first) |> should.equal(order.Gt)
  ifc_global_id.compare(first, equal) |> should.equal(order.Eq)
}

pub fn model_hash_is_a_distinct_wire_brand_test() {
  let first =
    model_content_sha256.from_wire(
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    )
  let equal =
    model_content_sha256.from_wire(
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    )
  let last =
    model_content_sha256.from_wire(
      "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
    )
  first
  |> model_content_sha256.value
  |> should.equal(
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  )
  { first == equal } |> should.be_true
  { first == last } |> should.be_false
  model_content_sha256.compare(first, last) |> should.equal(order.Lt)
  model_content_sha256.compare(last, first) |> should.equal(order.Gt)
  model_content_sha256.compare(first, equal) |> should.equal(order.Eq)
}

pub fn wire_mirrors_do_not_duplicate_rust_validation_or_normalization_test() {
  "not-a-global-id"
  |> ifc_global_id.from_wire
  |> ifc_global_id.value
  |> should.equal("not-a-global-id")
  "UPPERCASE-invalid-digest"
  |> model_content_sha256.from_wire
  |> model_content_sha256.value
  |> should.equal("UPPERCASE-invalid-digest")
}
