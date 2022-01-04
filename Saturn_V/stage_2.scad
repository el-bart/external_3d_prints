include<detail/config.scad>

module stage_2()
{
  scale(scale_factor)
    import("models/stage_2.stl");
}

stage_2();
