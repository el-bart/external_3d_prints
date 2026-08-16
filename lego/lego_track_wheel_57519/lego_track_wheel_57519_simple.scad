include <m3d/all.scad>

module lego_axle_slot(length)
{
  module lego_axle(length, spacing=0)
  {
    y = 1.80 + 2*spacing;
    x = 4.75 + 2*spacing;
    linear_extrude(length)
      for(dr=[0, 90])
        rotate([0, 0, dr])
          square([x, y], center=true);
  }

  lego_axle(length=length, spacing=0.3);
}


module wheel()
{
  module crossection()
  {
    projection(cut=false)
      translate([0, 0, -7.5])
      import("lego_track_wheel_57519.stl");
  }

  difference()
  {
    linear_extrude(5)
      crossection();
    // original cut did not work with actual axle
    translate([0,0,-eps])
      lego_axle_slot(5+2*eps);
  }
}

wheel();
