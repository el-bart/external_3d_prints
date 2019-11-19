module base_model()
{
  import("nanovna_front_lanyard_countersunk.stl", convexity=10);
}

module base_ring()
{
  difference()
  {
    base_model();
    translate([59,50,0])
      cube([100,100,20]);
  }
}

module ring()
{
  for(i=[0:1])
    translate(i*[0,0,-3.5])
      base_ring();
}

difference()
{
  union()
  {
    ring();
    base_model();
    translate([59,92,0])
      cube([3,19,2]);
  }
  translate([0,0,-10])
    cube([200,200,10]);
}