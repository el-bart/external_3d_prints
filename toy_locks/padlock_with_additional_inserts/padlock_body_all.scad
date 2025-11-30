use <detail/body1_fixed.scad>

translate([0, 0, 0])
  body1_fixed();

translate([0, 0, 25])
  rotate([0, 180, 0])
  import("models/body2.stl");

translate([45, 0, -5.5])
  import("models/shackle.stl");
