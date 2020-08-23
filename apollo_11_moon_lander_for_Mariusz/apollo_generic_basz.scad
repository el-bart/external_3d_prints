use <cone.scad>

import("ascent.stl");
translate([70, 0, 0])
  difference()
  {
    import("descent.stl");
    translate([0,0,26.2] -30/2*[1,1,0])
      cube(30*[1,1,1]);
  }

translate([70,0,26.2])
  cone();
