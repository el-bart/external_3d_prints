use <pi5-case-lid_fixed.scad>

translate([0, 0, 2])
  import("pi5-case-base.stl");

translate([65, 0, 0])
  lid_fixed();
