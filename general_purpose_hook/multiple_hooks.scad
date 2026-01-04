// preferred size
for(i = [0:3])
  translate([17*i, 0, 0])
    scale(0.75)
      import("no_hole_-_general_purpose_hook.stl");

// larger one, for bigger things
for(i = [0:3])
  translate([12*i, 38, 0])
    scale(0.50)
      import("no_hole_-_general_purpose_hook.stl");
