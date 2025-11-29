available = [
  "diamond",
  "heart",
  "lightning",
  "moon",
  "square",
  "triangle"
];

model = available[2];


translate([0, 0, 0])
  import("body1.stl");

translate([0, 0, 25])
  rotate([0, 180, 0])
  import("body2.stl");

translate([45, 0, -5.5])
  import("shackle.stl");

translate([0, -28, 34.5])
  rotate([-90, 0, 0])
  import( str("core_", model, ".stl") );

translate([45, -5, -10.6])
  import( str("key_", model, ".stl") );
