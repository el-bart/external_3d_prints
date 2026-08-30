include <m3d/all.scad>

difference()
{
  translate([-182.78, -177.1, 0])
    import("models/gear.stl");
#
  cylinder(d=5.2+0.3, h=10, $fn=100);
}
