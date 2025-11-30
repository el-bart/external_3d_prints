module core_expander(model)
{
  difference()
  {
    hull()
    {
      import( str("../models/core_", model, ".stl") );
    }
    translate([0, -0.3, 0])
      minkowski()
      {
        import( str("../models/key_", model, ".stl") );
        sphere(r=0.3, $fn=10);
      }
  }
}


module core_expander_position(model)
{
  translate([0, -28, 34.5])
    rotate([-90, 0, 0])
    children();
}
