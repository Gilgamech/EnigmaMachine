//Copyright 2022 Gilgamech Technologies
//Title: Enigma inner lid
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//ScaleFactor: 0.001
//Notes: 

//outerBox
oBLen=230;
oBWid=9;
oBHei=55;
//innerBox
iBins=(159/2);//79.5
iBspace = -(129/2);//64.5

iBLen=195;
iBWid=150;

thIBLen = iBLen/3;//65
iBTop=44.5;
topWidth = 170/3;//66.6
xLoc=-35;


//bottom
botLen=177;
botWid=221;
hBotLen=botLen/2;//89.5
hBotWid=botWid/2;//110.5

hOBWid=oBWid/2;//4.5
dOBWid=oBWid*2;//18
hOther=45/2;//22.5
hOther2=43/2;//21.5

//keys
keySpacing = (iBins-5)/4;
keySpacingEven = (iBins-5)/8;
yStart=0;
ySpacing=-20;

//main
//trayLid(0,0,45,iBTop+3.5);
trayLid();

module trayLid(rot=0,x=0,y=-51,z=0){
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
}}
enigmaLetters();
}}
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

module enigmaLetters(xRot=0,yHeight=0,xAdj=0,yStart=0,ySpacing=-20,zLift=0,rad=1.5,keySpacing = (iBins-5)/4,keySpacingEven = (130)/8) {

xShift=5;

firstRow = yStart+ySpacing*.7;
secondRow = yStart+ySpacing*1.45;
thirdRow = yStart+ySpacing*2.2;
    
firstCol = keySpacing*-3.7;
secondCol = keySpacing*-2.85;
thirdCol = keySpacing*-1.95;
fourthCol = keySpacing*-1.05;
fifthCol = keySpacing*-0.15;

sixthCol = keySpacing*0.7;
seventhCol = keySpacing*1.525;
eigthCol = keySpacing*2.5;
ninthCol = keySpacing*3.25;

//Top and bottom
translate([0,xAdj,yHeight]){
rotate([xRot,0,0]){
    
    gLetter("Q",2,firstCol,firstRow);
    gLetter("W",2,secondCol,firstRow);
    gLetter("E",2,thirdCol+1,firstRow);
    gLetter("R",2,fourthCol,firstRow);
    gLetter("T",2,fifthCol,firstRow);

    gLetter("Z",2,sixthCol,firstRow);
    gLetter("U",2,seventhCol,firstRow);
    gLetter("I",2,eigthCol,firstRow);
    gLetter("O",2,ninthCol,firstRow);

    gLetter("A",2,keySpacingEven*-4+xShift,secondRow);
    gLetter("S",2,keySpacingEven*-3+xShift,secondRow);
    gLetter("D",2,keySpacingEven*-2+xShift,secondRow);
    gLetter("F",2,keySpacingEven*-1+xShift,secondRow);

    gLetter("G",2,keySpacingEven*0+xShift-1,secondRow);
    gLetter("H",2,keySpacingEven*1+xShift-1,secondRow);
    gLetter("J",2,keySpacingEven*2+xShift,secondRow);
    gLetter("K",2,keySpacingEven*3+xShift-1,secondRow);
    
    
    gLetter("P",2,firstCol+1.25,thirdRow);
    gLetter("Y",2,secondCol+1.25,thirdRow);
    gLetter("X",2,thirdCol+1,thirdRow);
    gLetter("C",2,fourthCol-.25,thirdRow);
    gLetter("V",2,fifthCol-.25,thirdRow);

    gLetter("B",2,sixthCol,thirdRow);
    gLetter("N",2,seventhCol,thirdRow);
    gLetter("M",2,eigthCol-2.5,thirdRow);
    gLetter("L",2,ninthCol+1,thirdRow);

    
}}}

module gLetter(letter="A",size=2,xTran=0,yTran=0,zTran=0,xRot=0,yRot=0,zRot=0){
    translate([xTran,yTran,zTran])
    rotate([xRot,yRot,zRot])
    scale([.75,.75,.75])
    linear_extrude(size)
    text(letter);
}