$fn=50;

module core()
{
  intersection()
  {
    translate([210, -135, 0])
      import("centerfinderfdm.stl");
    cube([18, 300, 10], center=true);
  }
}

module bar()
{
  module hole_centers()
  {
    for(i=[-1, +1])
      translate([0, i*55, 0])
        children();
  }

  module extended()
  {
    core();
    hole_centers()
      cylinder(d=10, h=4+2.5);
  }

  module hole()
  {
    cylinder(d=6, h=3);
    translate([0, 0, 3])
    {
      cylinder(d1=6, d2=3.2, h=2);
      translate([0, 0, 2])
        cylinder(d=3.2, h=4);
    }
  }

  difference()
  {
    extended();
    hole_centers()
      hole();
  }
}


bar();
