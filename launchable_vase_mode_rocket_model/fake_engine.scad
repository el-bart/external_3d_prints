include <m3d/all.scad>

module fake_engine(d_ext, eng_d_extra=6, eng_h=11, h=30, wall=1)
{
  d1 = d_ext+ 2*eng_d_extra;
  module body()
  {
    cylinder(d=d_ext, h=h, $fn=fn(80));
    cylinder(d1=d1, d2=d_ext, h=eng_h, $fn=fn(80));
  }

  render()
    difference()
    {
      body();
      cylinder(d1=d1 - 2*wall, d2=d_ext - 2*wall, h=eng_h, $fn=fn(80));
    }
}


rotate([180, 0, 0])
  fake_engine(d_ext=12 - 0.1);
