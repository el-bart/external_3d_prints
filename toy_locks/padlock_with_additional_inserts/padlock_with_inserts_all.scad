use <core_lightning_fixed.scad>
use <body1_fixed.scad>

available = [
  "diamond",
  "heart",
  "lightning",
  "moon",
  "square",
  "triangle"
];

model = available[0];

module key()
{
  translate([45, -5, -10.6])
    import( str("models/key_", model, ".stl") );
}


module core()
{
  translate([0, -28, 34.5])
    rotate([-90, 0, 0])
    if(model == "lightning")
      core_lightning_fixed();
    else
      import( str("models/core_", model, ".stl") );
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
