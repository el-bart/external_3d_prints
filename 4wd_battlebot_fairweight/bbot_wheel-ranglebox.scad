include <m3d/all.scad>

module wheel()
{
  h = 12.6;
  d_ext = 2*12.1;

  module base()
  {
    translate([-175,-175,0])
      import("models/bbot_wheel-ranglebox.stl");
  }

  // center hole for 3mm screw
  difference()
  {
    base();
    cylinder(d=3+0.5, h=h, $fn=fn(50));
  }

  // no rims around
  difference()
  {
    $fn=fn(50);
    cylinder(d=d_ext, h=h);
    cylinder(d=d_ext-4, h=h);
  }
}


wheel();
