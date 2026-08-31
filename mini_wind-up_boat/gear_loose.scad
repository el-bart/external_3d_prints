include <m3d/all.scad>

module gear_center()
{
  difference()
  {
    translate([-182.78, -177.1, 0])
      import("models/gear_center.stl");
#
    cylinder(d=5.2+0.3, h=10, $fn=100);
  }
}


module gear_rear()
{
  difference()
  {
    translate([-182.405, -173.077, 0])
      import("models/gear_rear.stl");
#
    cylinder(d=8.2+0.3, h=10, $fn=100);
  }
}


gear_rear();

translate([30, 0, 0])
  gear_center();
