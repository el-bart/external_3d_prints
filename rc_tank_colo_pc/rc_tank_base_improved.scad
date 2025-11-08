include <m3d/all.scad>

translate([0, 0, 15])
  import("rc_tank_base.stl");

s = [2*43, 2*33, 2.5];
translate(-1/2*[s.x, s.y, 0])
  side_rounded_cube(s, 2);
