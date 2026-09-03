include <m3d/all.scad>
include <detail/config.scad>

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


module gear_shaft()
{
  difference()
  {
    union()
    {
      translate([-178.166, -167.131, 0])
        import("models/gear_shaft.stl");
      cylinder(d=5.95+0.3, h=prop_mount_h, $fn=100);
    }

    s_in  = (prop_mount_x + spacing)*[1,1,0] + [0, 0, prop_mount_h+2*eps];
#
    translate([0, 0, -eps])
      center_xy(s_in)
      cube(s_in);
  }
}



gear_rear();

translate([30, 0, 0])
  gear_center();

translate([12, 16, 0])
  gear_shaft();
