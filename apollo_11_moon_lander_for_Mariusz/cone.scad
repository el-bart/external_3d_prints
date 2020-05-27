module cone()
{
  wall=1;
  $fn=100;
  r1=21.5;
  r2=26.6;
  h=14;
  difference()
  {
    cylinder(r1=r1/2+wall, r2=r2/2+wall, h=h);
    cylinder(r1=r1/2,      r2=r2/2,      h=h);
  }
}

cone();
