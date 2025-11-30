module key_slot()
{
  module key_center()
  {
    translate([-25, -5, -10.6])
      import("key_lightning.stl");
  }

    key_center();
  offset(delta=0.3)
  projection(cut=true)
    translate([0, 0, -1])
    rotate([90, 0, 0])
    key_center();
}

key_slot();

  translate([0, -28, 34.5])
    rotate([-90, 0, 0])
    import("core_lightning.stl");
