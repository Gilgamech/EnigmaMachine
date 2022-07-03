//Copyright 2022 Gilgamech Technologies
//Title: Enigma Wheel 818
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//Notes: 

include  <lib-gear-dh.scad>
//vars
topWidth = 170/3;//66.6

//main
//enigmaWheels();
oneWheel();

//modules
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


module multiConnector(adder=1){
rotateDegree=13.846;//360/26
contact(rotateDegree*(1+adder));
contact(rotateDegree*(2+adder));
contact(rotateDegree*(3+adder));
contact(rotateDegree*(4+adder));
contact(rotateDegree*(5+adder));
contact(rotateDegree*(6+adder));
}
module contact(rot=0){
rotate([0,0,rot]){
translate([56,0,14]){
cylinder(h=32,r=4,center=true);
}}}
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
module oneWheel(x=0,y=0,z=0){
translate([x,y,z]){
wheel(.4,90,0,90);
}}
