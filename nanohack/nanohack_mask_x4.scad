function sig(n) = (n>0) ? 1 : 0;

for(x = [0:1])
  for(y = [0:1])
    translate([x*165, y*150+(sig(x)*65),0])
      import("mascarilla_original.stl");
