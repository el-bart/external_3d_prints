use <m3d/fn.scad>

module base()
{
  translate([-21.5, -250, -2.857])
    import("propeller_45mm_5mm.stl");
}

module prop()
{
  base();
  difference()
  {
    cylinder(d=10, h=12.88, $fn=fn(50));
    translate([0,0,-1])
      cylinder(d=3.3, h=14, $fn=fn(50));
  }
}


prop();
