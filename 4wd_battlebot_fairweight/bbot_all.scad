include <m3d/all.scad>
use <bbot_wheel-ranglebox.scad>

import("bbot_attesa-chassis-v3.stl");

translate([60, 0, 0])
  import("bbot_bottom-plate.stl");

translate([-66, 0, -19])
  import("bbot_top-plate.stl");

translate([-150, -210, 0])
  import("bbot_modulhitch.stl");

// 4x.
for(i=[1:4])
  translate([0, 9 -13*2*i, 0])
    wheel();
