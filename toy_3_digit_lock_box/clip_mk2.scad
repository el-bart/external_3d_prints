include <m3d/all.scad>

h = 1.0;
l = 11;
side = 2.7;
spring = 1.2;
hook = 2;
delta = 1.3;


module clip_mk2()
{
  // top and bottom
  for(dy=[0, l-hook])
    render()
      difference()
      {
        translate([-side, dy, 0])
          cube([2*side, hook, h]);
        if(dy!=0)
          translate([-delta, dy, 0])
            cube([2*delta, hook, h]);
      }
  // side arms
  for(dx=[-1,+1])
    translate([dx*delta, 0, 0] - [spring/2, 0, 0])
      cube([spring, l, h]);
}


clip_mk2();

%
translate([-0.2, 6.65, 0])
  rotate([0, 0, 170])
  translate([-172, -150, 0])
  import("detail/clip.stl");
