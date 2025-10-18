translate([0, 0, 3])
  import("body_a.stl");

translate([-45, -70, 0])
  import("body_b.stl");

translate([-85, -100, 0])
  import("detent_spring.stl");

translate([-150, -10, 0])
  import("key_handle.stl");

translate([-140, -24, 0])
  import("key_shaft.stl");

translate([10, 80, 0])
  translate([0, 0, 19.32])
  rotate([270, 0, 0])
  translate([0, -46.55, -0.2])
  import("locking_mechanism.stl");

translate([-65, 0, 4])
  import("open_source_decal.stl");

translate([0, -110, -0.2])
  import("shackle.stl");
