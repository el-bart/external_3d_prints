module gear()
{
  import("one_gear_no_center.stl");
  for(i=[-1,+1])
    translate([-22, -13.5*i, 0])
      cylinder(r=6, h=6.25);
}

module mount()
{
  difference()
  {
    import("arms2_single.stl");
    translate([0,-35,3.2])
      cube([20,70,10]);
    for(i=[-1, +1])
      translate([5.2, -5.5/2+i*25.5,2.2])
        cube([5.5, 5.5, 1]);
  }
}

for(i=[0,1])
  translate(i*[0, 60, 0])
    rotate([0,0,1]*90)
    {
      mount();
      gear();
    }
