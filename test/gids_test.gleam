// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gids/combo_name
import gids/data_key
import gids/etabs_object_name
import gids/frame_name
import gids/group_name
import gids/joint_name
import gids/load_case_id
import gids/material_id
import gids/member_id
import gids/member_part_id
import gids/mode_index
import gids/node_id
import gids/operation_id
import gids/sap_object_name
import gids/section_id
import gleam/order
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn member_id_round_trip_test() {
  member_id.from_wire(42)
  |> member_id.value
  |> should.equal(42)
}

pub fn member_id_compare_ordering_test() {
  member_id.compare(member_id.from_wire(1), member_id.from_wire(2))
  |> should.equal(order.Lt)
  member_id.compare(member_id.from_wire(2), member_id.from_wire(2))
  |> should.equal(order.Eq)
  member_id.compare(member_id.from_wire(3), member_id.from_wire(2))
  |> should.equal(order.Gt)
}

pub fn member_id_structural_equality_test() {
  { member_id.from_wire(42) == member_id.from_wire(42) }
  |> should.be_true
}

pub fn section_id_round_trip_test() {
  section_id.from_wire("W14x68")
  |> section_id.value
  |> should.equal("W14x68")
}

pub fn section_id_compare_ordering_test() {
  section_id.compare(section_id.from_wire("A"), section_id.from_wire("B"))
  |> should.equal(order.Lt)
  section_id.compare(section_id.from_wire("B"), section_id.from_wire("B"))
  |> should.equal(order.Eq)
  section_id.compare(section_id.from_wire("C"), section_id.from_wire("B"))
  |> should.equal(order.Gt)
}

pub fn section_id_structural_equality_test() {
  { section_id.from_wire("W14x68") == section_id.from_wire("W14x68") }
  |> should.be_true
}

pub fn every_module_smoke_test() {
  [
    member_id.from_wire(1) |> member_id.value,
    member_part_id.from_wire(2) |> member_part_id.value,
    operation_id.from_wire(3) |> operation_id.value,
    data_key.from_wire(4) |> data_key.value,
    node_id.from_wire(5) |> node_id.value,
    load_case_id.from_wire(6) |> load_case_id.value,
    mode_index.from_wire(7) |> mode_index.value,
  ]
  |> should.equal([1, 2, 3, 4, 5, 6, 7])

  [
    section_id.from_wire("section") |> section_id.value,
    material_id.from_wire("material") |> material_id.value,
    combo_name.from_wire("combo") |> combo_name.value,
    group_name.from_wire("group") |> group_name.value,
    frame_name.from_wire("frame") |> frame_name.value,
    joint_name.from_wire("joint") |> joint_name.value,
    sap_object_name.from_wire("sap") |> sap_object_name.value,
    etabs_object_name.from_wire("etabs") |> etabs_object_name.value,
  ]
  |> should.equal([
    "section",
    "material",
    "combo",
    "group",
    "frame",
    "joint",
    "sap",
    "etabs",
  ])
}
