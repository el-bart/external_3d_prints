include<detail/config.scad>

module stage_3()
{
  scale(scale_factor)
    intersection()
    {
      import("models/stage_3.stl");
      cylinder(d=40, h=66.45);
    }
}

stage_3();
