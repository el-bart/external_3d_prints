module model()
{
  translate([-65, -120, -124])
    import("detail/bottom.stl");
}

module engine()
{
  translate([-6.5, -7.5, -3])
    intersection()
    {
      model();
      translate([6.5, 7.6, 3])
        cylinder(d=11, h=40);
    }
}

module combined()
{
  translate([-0.8, -1.8, 0])
    model();

  for(dx=[-1,+1])
    for(dy=[-1,+1])
      translate([dx*20, dy*10, 13])
        if(true)
          engine();
        else
          #cylinder(d=11, h=20);
}

combined();
