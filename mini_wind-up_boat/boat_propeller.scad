include <m3d/all.scad>
include <detail/config.scad>

module original()
{
  translate([-125, -105, 0])
  {
    // combine both together, for an easier print
    import("models/use-brim-propeller.stl");
    import("models/use-brim-shaft.stl");
  }
}

module template(dh=eps)
{
  s_in  = prop_mount_x*[1,1,0] + [0, 0, prop_mount_h+dh];
  s_out =           10*[1,1,0] + [0, 0, prop_mount_h+dh];
  difference()
  {
    center_xy(s_out)
      cube(s_out);
    center_xy(s_in)
      cube(s_in);
  }
}


difference()
{
  original();
  translate([0, 0, 51 - prop_mount_h])
    template();
}
