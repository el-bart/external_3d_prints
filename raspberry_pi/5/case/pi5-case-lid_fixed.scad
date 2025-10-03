module lid_fixed()
{
  translate([0, 0, 11.6])
    rotate([0, 180, 0])
    import("pi5-case-lid.stl");
}

lid_fixed();
