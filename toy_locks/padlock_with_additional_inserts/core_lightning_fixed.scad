module core_lightning_fixed()
{
  difference()
  {
    hull()
    {
      import("core_lightning.stl");
    }
    translate([0, -0.3, 0])
      minkowski()
      {
        import("key_lightning.stl");
        sphere(r=0.3, $fn=10);
      }
  }
}


translate([0, -28, 34.5])
  rotate([-90, 0, 0])
  core_lightning_fixed();
