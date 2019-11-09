count = 2;

for(i = [1:count])
  translate([0, i*23, 0])
    import("door_stop.stl");
