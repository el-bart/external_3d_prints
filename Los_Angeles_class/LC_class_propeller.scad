include <m3d/all.scad>

module propeller(n=5)
{
  module blade()
  {
    translate([-1/2, 0])
      linear_extrude(height=3, twist=15, slices=40)
      square([1, 10]);
  }

  cylinder(d1=5, d2=1, h=8, $fn=fn(50));
  for(i=[0:n-1])
    rotate([0, 0, i*(360/n)])
      blade();
}


propeller(n=9);
