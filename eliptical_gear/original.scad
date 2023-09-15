for(i=[0,1])
  translate(i*[0, 60, 0])
    rotate([0,0,1]*90)
    {
      import("models/arms2_single.stl");
      import("models/one_gear_no_center.stl");
    }
