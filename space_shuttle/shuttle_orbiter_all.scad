translate([0, -30, 0])
  rotate([0, 0, -45])
    import("ShuttleOrbiterAft.stl");

translate([0, -0, 0])
  import("ShuttleOrbiterMid.stl");

translate([0, 11.45, 64])
  rotate([0,0,180])
    import("ShuttleOrbiterNose.stl");
