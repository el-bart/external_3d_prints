include <m3d/all.scad>

module base()
{
  import("models/spring.stl");
  %if($preview)
    translate([35, -13.3, -12.4])
    import("body_lock.stl");
}


module mask()
{
  translate([145, 130, 0])
  {
    translate([0, 23.6, 0])
      cube([10, 49, 9]);
    translate([12.8, 10, 0])
      cube([50, 40, 13.7]);
  }
}


module delta()
{
  intersection()
  {
    base();
    mask();
  }
}


module spring_strong()
{
  intersection()
  {
    minkowski()
    {
      delta();
      sphere(r=0.8);
    }
    mask();
  }
  base();
}


spring_strong();
