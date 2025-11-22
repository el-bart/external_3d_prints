include <m3d/all.scad>

module freewheel_mount()
{
  d_ext = 30.5 - 2*2.5;
  d_int = 14.8 - 2*0.5;
  h = (21.6 + 1)/2;
  $fn=fn(60);

  difference()
  {
    union()
    {
      cylinder(d=d_ext, h=1);
      cylinder(d=d_int, h=h);
    }
    translate([0, 0, -eps])
      cylinder(d=5 + 0.75, h=h+2*eps);
  }
}

freewheel_mount();
