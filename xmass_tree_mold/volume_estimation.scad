//
// this model is not meant to be printed!
// it's just for easy estimation of volume needed to fill the mold.
//

module mold()
{
  translate([71.18, 57, 125])
  {
    import("gussform-teil1.stl");
    import("gussform-teil2.stl");
  }
}

module tree()
{
  difference()
  {
    cube([130,108,130]);
    mold();
  }
}

tree();
