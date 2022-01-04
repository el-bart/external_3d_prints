include<detail/config.scad>


module triangle_(wall, h)
{
  linear_extrude(wall)
    polygon([ [0,0], [0,h], [h, h] ]);
}

module mesh_wall_(l, wall, h)
{
  translate([0, l/2, 0])
    for(m=[0,1])
      mirror([0, m, 0])
        translate([0, 0, h])
          rotate([0, 90, 0])
            triangle_(wall, h);
}

module support_mesh_(l)
{
  wall = 1.5;
  h = l/2;
  spacing = 15;
  n = ceil(l / spacing / 2);
  for(r=[0, 90])
    rotate([0, 0, r])
      for(i=[0:n-1])
        for(j=[-1,+1])
          translate(-1/2*[wall, l, 0] + j*[i*spacing, 0, 0])
            mesh_wall_(l, wall, h);
}


module shapped_support_mesh_()
{
  d_base = 29;
  d1 = scale_factor*(d_base-0);
  d2 = scale_factor*(d_base-1);
  l = d1;
    intersection()
    {
      support_mesh_(l);
      cylinder(d1=d1, d2=d2, h=l/2);
    }
}



module stage_1()
{
  scale(scale_factor)
    import("models/stage_1.stl");
  translate([0, 0, scale_factor*37.5])
    shapped_support_mesh_();
}

stage_1();
