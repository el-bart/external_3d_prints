include<detail/config.scad>

scale(scale_factor)
  for(dx=[0:1])
    translate([0, dx*32, 0])
      import("in/Booster_Single.stl");
