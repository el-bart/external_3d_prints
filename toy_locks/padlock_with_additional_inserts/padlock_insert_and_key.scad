use <detail/core_expender.scad>

available = [
  "diamond",
  "heart",
  "lightning",
  "moon",
  "square",
  "triangle"
];

model = available[3];


core_expander_position()
  core_expander(model);

translate([45, -5, -10.6])
  import( str("models/key_", model, ".stl") );
