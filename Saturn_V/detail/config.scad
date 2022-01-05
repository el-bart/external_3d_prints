scale_factor = 2;

module magnet_slot()
{
  w = 5;
  spacing = 0.4;
  l = w+spacing;
  translate(-1/2*l*[1,1,0])
    cube(l*[1,1,1]);
}



// TODO...
//module magnet_slots()
//{
//  r = 10;
//  for(x=[-1,+1])
//    for(y=[-1,+1])
//      translate([x*r, y*r, 50])
//        magnet_slot();
//}



//magnet_slot();
