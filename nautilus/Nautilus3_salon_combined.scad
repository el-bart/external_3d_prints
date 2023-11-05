module frame()
{
  intersection()
  {
    import("Nautilus3_salonframe_rotated.stl");
    translate([-50, 0, 0])
      cube([100, 100, 100]);
  }
}

module glass()
{
  intersection()
  {
    import("Nautilus3_salonglass_rotated.stl");
    translate([-50, 0, 0])
      cube([100, 100, 100]);
  }

}

module combined()
{
  module aligned()
  {
    frame();
    translate([0, 1.8, -2])
      glass();
  }
  
  module cropped()
  {
    intersection()
    {
      aligned();
      translate([-50, -50, 0])
        cube([100, 100, 100]);
    }
  }
  
  module base()
  {
    linear_extrude(1)
      offset(delta=-1)
        offset(delta=1)
          projection()
            cropped();
  }

  base();
  cropped();
}

for(i=[0:1])
  translate([0, i*32, 0])
    combined();

