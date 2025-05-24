include <m3d/all.scad>

import("cr2032_holder_cover.stl");

translate([0, 28, 0])
{
  import("cr2032_holder_shelve.stl");
  d = 27;
  #translate(d/2*[1,1,0])
    cylinder(d=d, h=4, $fn=fn(40));
}
