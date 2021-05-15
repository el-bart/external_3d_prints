module whale()
{
  import("model/whale.stl");
}

module half_whale()
{
  rotate([0, 90, 0])
    if(1)
    {
      // this model is NOT on the repo, but can be easily recreated
      // from original one, bith code below. conveninet for testing.
      import("model/half_whale.stl");
    }
    else
    {
      difference()
      {
        whale();
        translate([0, -50/2, 0])
          #cube([50, 50, 150]);
      }
    }
}


half_whale();
translate([150, -30, 0])
  rotate([0, 0, 180])
    mirror([0, 1, 0])
      half_whale();
