//Copyright 2022 Gilgamech Technologies
//Title: Enigma keyboard key
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//Notes: 

enigmaKey("W",-6.5,-6);
module enigmaKey(letter,x=0,y=-5.5,z=-5){
keyHeight = 30;
keyDia = 8;
    cylinder(h=keyHeight,r=1, $fn=100);
difference(){
translate([0,0,keyHeight]){
    cylinder(h=1,r=keyDia, $fn=100);
}
translate([0,0,keyHeight+.5]){
    cylinder(h=1,r=keyDia*.8, $fn=100);
}}
translate([x,y,keyHeight]){
linear_extrude(2){
 text(letter);
}}}
