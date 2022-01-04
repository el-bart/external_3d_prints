include<detail/config.scad>

module stage_3()
{
  scale(scale_factor)
    import("models/stage_3.stl");
}

stage_3();
