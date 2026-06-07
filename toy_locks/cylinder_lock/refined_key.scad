include <m3d/all.scad>

module refined_key()
{
  difference()
  {
    import("models/lock_key.stl");

    // top groove
    translate([0, -1.66, 1.22] + [0, -0.3, -0.4])
      cube([50, 10, 5]);

    // bottom groove
    translate([0, -2.8, -2.13] + [0, 0, 0])
      cube([50, 1.8, 1.6]);
  }
}

refined_key();
