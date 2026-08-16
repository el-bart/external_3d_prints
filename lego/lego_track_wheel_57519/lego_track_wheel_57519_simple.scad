module wheel()
{
  module crossection()
  {
    projection(cut=false)
      translate([0, 0, -7.5])
      import("lego_track_wheel_57519.stl");
  }

  linear_extrude(5)
    crossection();
}

wheel();
