include<detail/config.scad>

module support_mesh_()
{
  l = 2*20;
  wall = 1.5;
  h = l/2/2;
  translate(-1/2*[wall, l, 0])
  cube([wall, l, h]);
}


module stage_1()
{
  scale(scale_factor)
    import("models/stage_1.stl");
    
//intersection()
//{
//  import("SaturnV_ver3_Stage-1.stl");
//  translate(47*[0,0,1])
//    cylinder(r=20, h=6);
//}

}

stage_1();
//support_mesh_();
