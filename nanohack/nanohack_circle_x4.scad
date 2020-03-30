for(x = [0:1])
  for(y = [0:1])
    translate([x*40,y*40,0])
      import("circulo_honey.stl");
