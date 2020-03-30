for(x = [0:1])
  for(y = [0:1])
    translate([x*47,y*47,0])
      import("tapa.stl");
