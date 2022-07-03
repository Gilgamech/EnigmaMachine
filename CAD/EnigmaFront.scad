//Copyright 2022 Gilgamech Technologies
//Title: Enigma front cover
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//Notes: 

//outerBox
oBLen=230;
oBWid=9;
oBHei=55;
//innerBox
iBins=(159/2);

//bottom
botLen=177;
botWid=221;
hBotLen=botLen/2;
hBotWid=botWid/2;

hOBWid=oBWid/2;
hOther=45/2;

//boxFront();
boxFront(90,hOBWid,0,oBHei/2);

module boxFront(rot=90,x=hBotLen+oBHei-8,y=0,z=-(oBWid*2)){
rotate([0,0,rot]){
translate([x,y,z]){
    cube([oBWid,179,oBHei-3], center=true);
}}}

