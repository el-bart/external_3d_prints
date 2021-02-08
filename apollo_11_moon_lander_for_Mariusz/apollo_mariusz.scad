use <detail/cone.scad>

module support()
{
  difference()
  {
    cube([10, 20, 25]);
    translate([10/2, 2, 2])
    rotate([60, 0, 0])
    {
      cube([10, 40, 30]);
      translate([-8,0,3])
        cube([10, 40, 30]);
    }
  }
}

module plate()
{
  // main plate
  translate([-120/2,-35/2,0])
    cube([120, 30, 2]);
  // text
  translate([0,0,2])
  {
    size=10;
    font="Arial:style=Italic";
    linear_extrude(height=2)
    {
      text("To the Mün",
           size=size, font=font, halign="center");
      translate([0, -size*1.2, 0])
        text("and back, Mariusz!",
             size=size, font=font, halign="center");
    }
  }
}


import("detail/ascent.stl");
translate([70, 0, 0])
  import("detail/descent.stl");

translate([40, -55, 0])
  plate();

translate([110, -20, 0])
{
  support();
  translate([25, 0, 0])
    mirror([1,0, 0])
      support();
}

translate([120,-50,0])
  cone();
