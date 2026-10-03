// SPDX-License-Identifier: MIT
// Copyright (c) 2026 Cong Phap

import gids/annotation_id
import gids/batch_operation_id
import gids/bim_addition_name
import gids/combo_name
import gids/data_key
import gids/definition_id
import gids/detail_instance_id
import gids/entity_id
import gids/etabs_object_name
import gids/frame_guid
import gids/frame_id
import gids/frame_name
import gids/grid_line_name
import gids/group_name
import gids/host_entity_id
import gids/joint_family_id
import gids/joint_guid
import gids/joint_name
import gids/link_guid
import gids/link_name
import gids/load_case_id
import gids/load_case_name
import gids/material_id
import gids/member_id
import gids/member_part_id
import gids/mode_index
import gids/node_id
import gids/operation_id
import gids/parameter_name
import gids/part_instance_id
import gids/port_name
import gids/process_id
import gids/render_profile_id
import gids/sap_object_name
import gids/saved_run_id
import gids/section_id
import gids/snapshot_revision_id
import gids/story_name
import gids/template_name
import gids/view_name
import gids/view_option_preset_id
import gids/weld_spec_id
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
    process_id.from_wire(8) |> process_id.value,
  ]
  |> should.equal([1, 2, 3, 4, 5, 6, 7, 8])

  [
    section_id.from_wire("section") |> section_id.value,
    material_id.from_wire("material") |> material_id.value,
    combo_name.from_wire("combo") |> combo_name.value,
    load_case_name.from_wire("case") |> load_case_name.value,
    group_name.from_wire("group") |> group_name.value,
    frame_name.from_wire("frame") |> frame_name.value,
    joint_name.from_wire("joint") |> joint_name.value,
    link_name.from_wire("link") |> link_name.value,
    sap_object_name.from_wire("sap") |> sap_object_name.value,
    etabs_object_name.from_wire("etabs") |> etabs_object_name.value,
    batch_operation_id.from_wire("batch") |> batch_operation_id.value,
    detail_instance_id.from_wire("detail") |> detail_instance_id.value,
    definition_id.from_wire("definition") |> definition_id.value,
    part_instance_id.from_wire("part") |> part_instance_id.value,
    entity_id.from_wire("entity") |> entity_id.value,
    annotation_id.from_wire("annotation") |> annotation_id.value,
    port_name.from_wire("port") |> port_name.value,
    weld_spec_id.from_wire("weld") |> weld_spec_id.value,
    render_profile_id.from_wire("render") |> render_profile_id.value,
    host_entity_id.from_wire("host") |> host_entity_id.value,
    frame_id.from_wire("frame_id") |> frame_id.value,
    parameter_name.from_wire("parameter") |> parameter_name.value,
    grid_line_name.from_wire("grid") |> grid_line_name.value,
    story_name.from_wire("story") |> story_name.value,
    joint_family_id.from_wire("family") |> joint_family_id.value,
    template_name.from_wire("template") |> template_name.value,
    view_name.from_wire("view") |> view_name.value,
    view_option_preset_id.from_wire("preset") |> view_option_preset_id.value,
    bim_addition_name.from_wire("addition") |> bim_addition_name.value,
    snapshot_revision_id.from_wire("revision") |> snapshot_revision_id.value,
    saved_run_id.from_wire("saved-run") |> saved_run_id.value,
  ]
  |> should.equal([
    "section",
    "material",
    "combo",
    "case",
    "group",
    "frame",
    "joint",
    "link",
    "sap",
    "etabs",
    "batch",
    "detail",
    "definition",
    "part",
    "entity",
    "annotation",
    "port",
    "weld",
    "render",
    "host",
    "frame_id",
    "parameter",
    "grid",
    "story",
    "family",
    "template",
    "view",
    "preset",
    "addition",
    "revision",
    "saved-run",
  ])
}

pub fn grid_line_name_round_trip_test() {
  grid_line_name.from_wire("B.5")
  |> grid_line_name.value
  |> should.equal("B.5")
}

pub fn grid_line_name_compare_ordering_test() {
  grid_line_name.compare(
    grid_line_name.from_wire("A"),
    grid_line_name.from_wire("B"),
  )
  |> should.equal(order.Lt)
  grid_line_name.compare(
    grid_line_name.from_wire("B"),
    grid_line_name.from_wire("B"),
  )
  |> should.equal(order.Eq)
  grid_line_name.compare(
    grid_line_name.from_wire("C"),
    grid_line_name.from_wire("B"),
  )
  |> should.equal(order.Gt)
}

pub fn grid_line_name_structural_equality_test() {
  { grid_line_name.from_wire("B.5") == grid_line_name.from_wire("B.5") }
  |> should.be_true
}

pub fn story_name_compare_ordering_test() {
  story_name.compare(story_name.from_wire("L1"), story_name.from_wire("L2"))
  |> should.equal(order.Lt)
  story_name.compare(story_name.from_wire("L2"), story_name.from_wire("L2"))
  |> should.equal(order.Eq)
  story_name.compare(story_name.from_wire("L3"), story_name.from_wire("L2"))
  |> should.equal(order.Gt)
}

/// The Rust boundary refuses empty and padded names; these brands carry any
/// wire string through unchanged.
pub fn overlay_brands_pass_through_values_the_rust_boundary_refuses_test() {
  [
    grid_line_name.from_wire("") |> grid_line_name.value,
    story_name.from_wire(" L2") |> story_name.value,
    view_name.from_wire("elevation ") |> view_name.value,
  ]
  |> should.equal(["", " L2", "elevation "])
}

pub fn host_guids_round_trip_and_compare_test() {
  frame_guid.from_wire("2f674053-cadb-4b5a-ab91-25b76bc5a4a8")
  |> frame_guid.value
  |> should.equal("2f674053-cadb-4b5a-ab91-25b76bc5a4a8")
  joint_guid.from_wire("18d27ac4-4c40-4f45-a057-a61645c6c23b")
  |> joint_guid.value
  |> should.equal("18d27ac4-4c40-4f45-a057-a61645c6c23b")
  link_guid.from_wire("7c1e0b9a-3d52-4f0e-9a61-0b2c4d6e8f10")
  |> link_guid.value
  |> should.equal("7c1e0b9a-3d52-4f0e-9a61-0b2c4d6e8f10")
  joint_guid.compare(
    joint_guid.from_wire("18d27ac4-4c40-4f45-a057-a61645c6c23b"),
    joint_guid.from_wire("2f674053-cadb-4b5a-ab91-25b76bc5a4a8"),
  )
  |> should.equal(order.Lt)
}

pub fn saved_run_id_round_trips_and_compares_test() {
  saved_run_id.from_wire("0b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f")
  |> saved_run_id.value
  |> should.equal("0b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f")
  saved_run_id.compare(
    saved_run_id.from_wire("0b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f"),
    saved_run_id.from_wire("1b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f"),
  )
  |> should.equal(order.Lt)
  {
    saved_run_id.from_wire("0b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f")
    == saved_run_id.from_wire("0b9e4f1c-6a2d-4c3e-8f70-1d2c3b4a5e6f")
  }
  |> should.be_true
}

pub fn snapshot_revision_id_structural_equality_test() {
  {
    snapshot_revision_id.from_wire("rev-7")
    == snapshot_revision_id.from_wire("rev-7")
  }
  |> should.be_true
}

pub fn definition_id_round_trip_test() {
  definition_id.from_wire("detail.baseplate.stiffened.v1")
  |> definition_id.value
  |> should.equal("detail.baseplate.stiffened.v1")
}

/// The Rust boundary owns the `detail.<family>.<slug>.vN` grammar; this brand
/// carries any wire string through unchanged.
pub fn definition_id_passes_through_non_grammar_values_test() {
  definition_id.from_wire("Detail.Bad.Slug.v0")
  |> definition_id.value
  |> should.equal("Detail.Bad.Slug.v0")
}

pub fn definition_id_compare_ordering_test() {
  definition_id.compare(
    definition_id.from_wire("detail.a.x.v1"),
    definition_id.from_wire("detail.b.x.v1"),
  )
  |> should.equal(order.Lt)
  definition_id.compare(
    definition_id.from_wire("detail.b.x.v1"),
    definition_id.from_wire("detail.b.x.v1"),
  )
  |> should.equal(order.Eq)
  definition_id.compare(
    definition_id.from_wire("detail.c.x.v1"),
    definition_id.from_wire("detail.b.x.v1"),
  )
  |> should.equal(order.Gt)
}

pub fn definition_id_structural_equality_test() {
  {
    definition_id.from_wire("detail.baseplate.stiffened.v1")
    == definition_id.from_wire("detail.baseplate.stiffened.v1")
  }
  |> should.be_true
}
