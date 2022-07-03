//Copyright 2022 Gilgamech Technologies
//Title: Enigma box top
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

translate([0,116,-127.5]){
boxTop(155);
}

module boxTop(zLoc=55) {
union(){
translate([0,0,zLoc+23]){
    cube([botLen-18,botWid-7,oBWid], center=true);
}
topBoxSide(zLoc,iBins+hOBWid,oBLen,oBHei);//side
topBoxSide(zLoc,-iBins-hOBWid,oBLen,oBHei);//other side
rotate([0,0,90]){
translate([iBins+32,0,zLoc]){
    cube([oBWid,botLen,oBHei], center=true);//back
}}
rotate([0,0,-90]){
translate([iBins+32,0,zLoc]){
    cube([oBWid,botLen,oBHei], center=true);//front
}}}}
module topBoxSide(zLoc,xLoc=iBins,y=botLen,z=oBHei,x=oBWid) {
translate([xLoc,0,zLoc]){
    cube([x,y,z], center=true);
}}
