include<detail/config.scad>

module stage_2()
{
  scale(scale_factor)
    intersection()
    {
      import("models/stage_2.stl");
      cylinder(d=40, h=44.72);
    }
}

stage_2();
