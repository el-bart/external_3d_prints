function sig(n) = (n>0) ? 1 : 0;

module top()
{
  union()
  {
    translate([-39, -342, 9.75])
      import("tapa.stl");
    hull()
    {
      for(dx = [-1:+1])
        translate([dx*(70-10/2)/2, 0, 0])
          cylinder(r=10/2, h=2);
    }
    hull()
    {
      for(dy = [-1:+1])
        translate([0, dy*(70-10/2)/2, 0])
          cylinder(r=10/2, h=2);
    }
  }
}

for(x = [0:1])
  for(y = [0:1])
    translate([x*46, y*78+(sig(x)*70/2), 0])
      top();
