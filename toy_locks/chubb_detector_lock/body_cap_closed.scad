include <m3d/all.scad>

wall = 3;

module body_cap()
{
  translate([-117, -114, 0])
    import("body_cap.stl");
}

module closed_plate()
{
  module body_cap_base_2d()
  {
    projection(cut=true)
      body_cap();
  }

  module key_hole()
  {
    difference()
    {
      translate([110, 62])
        square([14, 40]);
      body_cap_base_2d();
    }
  }

  difference()
  {
    hull()
      body_cap_base_2d();
    key_hole();
  }
}

module body_cap_closed()
{
  linear_extrude(wall)
    closed_plate();
  translate([0,0,wall])
    body_cap();
}


body_cap_closed();
