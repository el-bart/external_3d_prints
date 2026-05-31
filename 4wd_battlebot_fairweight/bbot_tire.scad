include <m3d/all.scad>

module tire()
{
  h = 12.6;
  wall = 1;
  d_int = 2*12.1 + 0.1;
  d_ext = d_int + 2*wall;
  r_track = 1;
  spikes = 30;

  $fn=fn(50);

  module outer()
  {
    cylinder(d=d_ext, h=h);
    for(i=[0:spikes-1])
      rotate([0, 0, i*360/spikes])
      translate([-wall/2, 0, 0])
        cube([wall, d_ext/2+r_track, h]);
  }

  difference()
  {
    outer();
    translate([0,0,-eps])
      cylinder(d=d_ext-4, h=h+2*eps);
  }
}


tire();
