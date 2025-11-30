use <detail/core_expender.scad>
use <body1_fixed.scad>

available = [
  "diamond",
  "heart",
  "lightning",
  "moon",
  "square",
  "triangle"
];

model = available[3];

module key()
{
  translate([45, -5, -10.6])
    import( str("models/key_", model, ".stl") );
}


module core()
{
  core_expander_position()
    core_expander(model);
}


translate([0, 0, 0])
  body1_fixed();

translate([0, 0, 25])
  rotate([0, 180, 0])
  import("models/body2.stl");

translate([45, 0, -5.5])
  import("models/shackle.stl");

core();
key();
