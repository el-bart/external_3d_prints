module body2_fixed()
{
  extra_depth = 1;
  spacing_r = 0.3;

  module pins()
  {
    difference()
    {
      import("models/body2.stl");
      translate([-10, -10, 12.5])
        cube([100, 100, 100]);
    }
  }

  module pins_slots_large()
  {
    minkowski()
    {
      pins();
      sphere(r=spacing_r, $fn=10);
    }
  }

  module pins_cylinders()
  {
    dh = 10;
    updown = 12;
    translate([0, 0, updown])
      linear_extrude(dh)
      projection(cut=true)
      translate([0, 0, -updown])
      pins_slots_large();
  }

  module pins_slots_large_long()
  {
    pins_cylinders();
    pins_slots_large();
  }

  difference()
  {
    import("models/body1.stl");
    translate([0, 0, -extra_depth])
      pins_slots_large_long();
  }
}


body2_fixed();
