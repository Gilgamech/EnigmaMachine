//Copyright 2022 Gilgamech Technologies
//Title: Enigma base section
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//Notes: 

include  <lib-gear-dh.scad>
include  <Gilgahedron.scad>

//vars 
oBLen=230;
botWid=221;
iBLen=195;
botLen=177;
iBWid=150;

oBHei=55;
iBTop=44.5;

oBWid=9;
yStart=0;
ySpacing=-20;
xLoc=-35;

//composite vars
hBotWid=botWid/2;//110.5
hBotLen=botLen/2;//89.5
iBins=(159/2);//79.5
topWidth = 170/3;//66.6
thIBLen = iBLen/3;//65
iBspace = -(129/2);//64.5

hOther=45/2;//22.5
hOther2=43/2;//21.5
keySpacing = (iBins-5)/4;//18.625
dOBWid=oBWid*2;//18
keySpacingEven = (iBins-5)/8;//9.3125
hOBWid=oBWid/2;//4.5

//main
base();
//enigmaKeyboard();    
//trayLid(0,0,45,iBTop+3.5);
//enigmaWheels();
//frontPlug(0,-77,5.5);

module frontPlug(xTran=0,yTran=0,zTran=0){
len=9;
plugLen=4;
plugSep=3.5;
union(){
gCylinder(len,2,2,xTran,yTran,zTran-plugSep,90);
gCylinder(len+plugLen,1,1,xTran,yTran+len,zTran-plugSep,90);
gCube(4,len,plugSep*2.2,xTran,yTran,zTran);
gCylinder(len,2,2,xTran,yTran,zTran+plugSep,90);
gCylinder(len+plugLen,1,1,xTran,yTran+len,zTran+plugSep,90);
}}

//Enigma Machine
module base(){
outerBox();
boxSpacers();
difference(){
innerBox();
enigmaKeyholes(0,0,0,0,-20,30);
enigmaKeyholes(90,59,-15,-5,-15,30);
enigmaKeyholes(90,52,-15,-5,-15,30);
}}
module outerBox(){
difference(){
union(){
//sides
    outerBoxSide();
    outerBoxSide(-hBotLen);
//back
rotate([0,0,90]){
    outerBoxSide(hBotWid,botLen);
}
//bottom
boxTopBot(-23);
}
rotate([0,0,-90]){
translate([hBotLen+22,0,2]){
    cube([oBWid+.1,181,oBHei], center=true);
}}}}
module innerBox() {
    innerBoxSide();//side
    innerBoxSide(-iBins);//other side
rotate([0,0,90]){
translate([iBins+hOther,0,hOther2]){
    cube([oBWid,iBWid,oBHei], center=true);//back
}}
rotate([0,0,90]){
translate([iBspace-1.5,0,hOther2]){
    cube([oBWid,iBWid,oBHei], center=true);//front
    
}
translate([xLoc,0,iBTop]){
    cube([topWidth,botLen-27,oBWid], center=true);//keyboard
}
difference(){
translate([xLoc+topWidth*1.5,0,25]){
    cube([topWidth*2,botLen-27,oBWid], center=true);//tray
}
translate([topWidth+10,38,25]){
    cube([63,40,15], center=true);//wheel gap
}}}}


module boxSpacers(){
spacerBlock();
spacerBlock(-hBotLen+10);
spacerBlock(hBotLen-10,iBspace);
spacerBlock(-hBotLen+10,iBspace);
}



//lid
module trayLid(rot=0,x=0,y=0,z=0){
translate([x,y,z]){
difference(){
    rotate([0,0,rot+90]){
    cube([topWidth*1.8,botLen-27,2], center=true);//tray
}
rotate([0,0,rot]){
enigmaKeyholes(0,-20,10,-5,-15,10,5,(iBins-15)/4,(iBins-15)/8);
enigmaWheelWindow(-topWidth+7.5,topWidth/2-5,0);//WheelC
enigmaWheelWindow(-topWidth+20.5,topWidth/2-5,0);//WheelB
enigmaWheelWindow(-topWidth+33.5,topWidth/2-5,0);//WheelA
}}}}
module enigmaWheelWindow(x=-topWidth+7.5,y=topWidth+11,z=iBTop+3.5) {
translate([x,y,z]){
    cube([5,10,5], center=true);//number window
}
translate([x-6,y,z]){
    cube([5,45,5], center=true);//gear gap
}}
module enigmaKeyholes(xRot=0,yHeight=0,xAdj=0,yStart=0,ySpacing=-20,zLift=0,rad=1.5,keySpacing = (iBins-5)/4,keySpacingEven = (iBins-5)/8) {

//Top and bottom
translate([0,xAdj,yHeight]){
rotate([xRot,0,0]){

    enigmaKeyhole(0,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(0,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*2,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*2,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*3,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*3,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*4,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*4,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*-1,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*-1,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*-2,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*-2,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*-3,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*-3,yStart+ySpacing*3,zLift,rad);

    enigmaKeyhole(keySpacing*-4,yStart+ySpacing*1,zLift,rad);
    enigmaKeyhole(keySpacing*-4,yStart+ySpacing*3,zLift,rad);


    enigmaKeyhole(keySpacingEven*-7,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*-5,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*-3,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*-1,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*1,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*3,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*5,yStart+ySpacing*2,zLift,rad);
    enigmaKeyhole(keySpacingEven*7,yStart+ySpacing*2,zLift,rad);
    
    
}}}
module enigmaKeyhole(x=0,y=0,z=0,rad=1.5){
translate([x,y,z]){
    cylinder(h=30,r=rad, $fn=100);
}}

//wheels
module wheel(sc=1,x=0,y=0,z=0){
scale([sc,sc,sc]){
rotate([x,y,z]){

difference(){
union(){
gear(26,5,83.7);
translate([0,0,18]){
cylinder(h=20,r=66.6,center=true);
}}
translate([0,0,20]){
cylinder(h=45,r=5,center=true);
}}

multiConnector();
multiConnector(6);
multiConnector(12);
multiConnector(18);
multiConnector(24);
multiConnector(30);

}}}
module contact(rot=0){
rotate([0,0,rot]){
translate([56,0,14]){
cylinder(h=32,r=4,center=true);
}}}
module multiConnector(adder=1){
rotateDegree=13.846;//360/26
contact(rotateDegree*(1+adder));
contact(rotateDegree*(2+adder));
contact(rotateDegree*(3+adder));
contact(rotateDegree*(4+adder));
contact(rotateDegree*(5+adder));
contact(rotateDegree*(6+adder));
}
module enigmaWheels(x=-topWidth,y=topWidth+10,z=22){
mult=13;
translate([x,y,z]){
wheel(.4,90,0,90);
}
translate([x+mult,y,z]){
wheel(.4,90,0,90);
}
translate([x+mult*2,y,z]){
wheel(.4,90,0,90);
}}

//keyboard
module enigmaKey(x=0,y=0,z=0){
keyHeight = 30;
keyDia = 8;
translate([x,y,z]){
    cylinder(h=keyHeight,r=1, $fn=100);
}
difference(){
translate([x,y,z+keyHeight]){
    cylinder(h=1,r=keyDia, $fn=100);
}
translate([x,y,z+keyHeight+.5]){
    cylinder(h=1,r=keyDia*.8, $fn=100);
}}}
module enigmaKeyboard() {

//Top and bottom
    enigmaKey(0,yStart+ySpacing*1,30);
    enigmaKey(0,yStart+ySpacing*3,30);

    enigmaKey(keySpacing,yStart+ySpacing*1,30);
    enigmaKey(keySpacing,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*2,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*2,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*3,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*3,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*4,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*4,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*-1,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*-1,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*-2,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*-2,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*-3,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*-3,yStart+ySpacing*3,30);

    enigmaKey(keySpacing*-4,yStart+ySpacing*1,30);
    enigmaKey(keySpacing*-4,yStart+ySpacing*3,30);


    enigmaKey(keySpacingEven*-7,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*-5,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*-3,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*-1,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*1,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*3,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*5,yStart+ySpacing*2,30);
    enigmaKey(keySpacingEven*7,yStart+ySpacing*2,30);
    
    
}

//etc
module innerBoxSide(xLoc=iBins,y=botLen,z=oBHei,x=oBWid) {
translate([xLoc,dOBWid,hOther2]){
    cube([x,y,z], center=true);
}}
module outerBoxSide(xLoc=hBotLen,y=oBLen,z=oBHei,x=oBWid) {
translate([xLoc,0,0]){
    cube([x,y,z], center=true);
}}
module boxTopBot(z){
translate([0,-hOBWid,z]){
    cube([botLen,botWid,oBWid], center=true);
}}
module spacerBlock(x=hBotLen-10,y=hBotWid-10,z=-12) {
translate([x,y,z]){
    cube([12,12,12], center=true);
}}