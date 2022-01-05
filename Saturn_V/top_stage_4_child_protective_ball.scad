include<detail/config.scad>

module protective_ball()
{
  d_measured = 4.8/2; // 4.8mm @ scale_factor=2
  d_top = scale_factor*(d_measured+0.2);
  d = scale_factor*8;
  bottom = scale_factor*1;
  difference()
  {
    translate([0, 0, d/2])
      sphere(d=d, $fn=scale_factor*100);
    cylinder(d=d_top, h=3/4*d, $fn=scale_factor*80);
    translate(-1/4*scale_factor*[d,d,0])
    cube(1/2*scale_factor*[d,d,1]);
  }
}


protective_ball();
