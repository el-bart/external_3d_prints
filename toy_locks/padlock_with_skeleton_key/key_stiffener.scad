include <m3d/all.scad>

wall = 2.3;
spacing = 0.25;
holder_cut_h = 4;
d_int = 7.5 + spacing;
d_ext = d_int + 2*wall;
d_h = 10;
tooth_size = [2.25, 6.85, 5.10] + spacing*[2,2,1];

module stiffener()
{
  module holder_profile_2d()
  {
    offset(r=spacing)
      projection(cut=true)
      translate([0, 0, -holder_cut_h])
      translate([1, 0, 0])
      rotate([0, -90, 0])
      translate([-113.5, -105, 0])
      import("key_handle.stl");
  }

  module holder_profile_2d_ext()
  {
    offset(r=wall)
      holder_profile_2d();
  }

  module core()
  {
    // core bottom part
    cylinder(d=d_ext, h=d_h, $fn=fn(50));
    // rounding of the mount
    hull()
    {
      translate([0, 0, d_h])
        linear_extrude(holder_cut_h)
        holder_profile_2d_ext();
      cylinder(d=d_ext, h=1, $fn=fn(50));
    }
  }

  difference()
  {
    core();
    // top cut
    translate([0, 0, d_h])
      linear_extrude(holder_cut_h + eps)
      holder_profile_2d();
    // bottom cut
    translate([0, 0, -eps])
      cylinder(d=d_int, h=d_h+eps, $fn=fn(60));
    // mount tooth support
    translate([1.6/2, -tooth_size.y/2, 0])
      cube(tooth_size + [0,0,d_h]);
  }
}


stiffener();
