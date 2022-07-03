//Copyright 2022 Gilgamech Technologies
//Title: Enigma base section
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//Notes: 

include  <gCube.scad>
frontPlug();
module frontPlug(xTran=0,yTran=0,zTran=0){
len=9;
plugLen=7;
plugSep=3.5;
union(){
gCylinder(len,2,2,xTran,yTran,zTran-plugSep,90);
gCylinder(len+plugLen,1,1,xTran,yTran+plugLen,zTran-plugSep,90);
gCube(3.98,len,plugSep*2.2,xTran,yTran,zTran);
gCylinder(len,2,2,xTran,yTran,zTran+plugSep,90);
gCylinder(len+plugLen,1,1,xTran,yTran+plugLen,zTran+plugSep,90);
}}
