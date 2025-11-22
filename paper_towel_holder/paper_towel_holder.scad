use <model/kitchenrollmount.scad>

rotate([-90,0,0])
  translate([0, -80, 0])
  handle();

translate([0, -10, 0])
  rotate([90,0,0])
  mount_front();

translate([0, 0, 6])
  rotate([180,0,0])
  translate([50, -15, 0])
  mount_front_fixture();

rotate([-90,0,0])
  translate([-70, -80, 0])
  mount_back();
