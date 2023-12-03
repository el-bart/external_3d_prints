module fin_input_()
{
  translate([16.2, -0, 1.9])
    rotate([-90, 0, 0])
      translate([0, 0, -37])
        import("B4_Grid_Fin.stl");
}

module fin_grid_profile_()
{
  intersection()
  {
    projection(cut=true)
      translate([0, 0, -2])
        fin_input_();
    square([20, 14.05]);
  }
}

module fin()
{
  difference()
  {
    // remove bottom part of mount cylinder
    intersection()
    {
      fin_input_();
      cube([20, 20, 20]);
    }
    // remove grid teeth - too small to be printed reasonably anyway...
    translate([0, 0, 2.5])
      cube([20, 14.05, 10]);
  }
  // equalize bottom part
  linear_extrude(1)
    fin_grid_profile_();
}


fin();
