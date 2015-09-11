//26mm/100px
mm=3.848;

projection() Chassis(length=110*mm, width=110*mm);

module Chassis(width=5*mm, length=5*mm) {
    difference() {
        RoundedRect(width, length, 5*mm);
        MotorHoles(width=width, length=length);
        WheelScrewHoles(length=length);
        AccessHoles(length=length);
        PowerHoles(length=length);
    }
}

module PowerHoles(length, $fa=5, $fs=1) {
    offset = 2*mm;
    translate([length/2 - offset, 0*mm])
        cube(size=[5*mm, 10*mm, 500*mm], center=true);
}

module AccessHoles(length, $fa=5, $fs=1) {
    offset=15*mm;
    rows=3;
    cols=4;
    
    for(row=[1:rows], col=[1:cols], side=[-1, 1]) {
        translate([-row*15*mm + offset, side*col*10*mm])
            cube(size=[3*mm, 5*mm, 500*mm], center=true);
    }
}

module MotorHoles(width, length, $fa=5, $fs=1) {
    offset1=15*mm;
    offset2=45*mm;
    motorwidth=20*mm;
    
    for(side=[-1, 1], padding=[-4*mm, motorwidth]) {
        translate([length / 2 - offset1, (width / 2 - padding) * side])
            cube(size=[5*mm, 3*mm, 500*mm], center=true);
        
        translate([length / 2 - offset2, (width / 2 - padding) * side])
            cube(size=[5*mm, 3*mm, 500*mm], center=true);
    }
}

module WheelScrewHoles(length, $fa=5, $fs=1) {
    offset=10*mm;
    mountwidth=40*mm;
    
    for(side=[-1, 1]) {
        translate([-length / 2 + offset, mountwidth/2 * side])
            cylinder(d=2*mm, h=500*mm, center=true);
    }
    
}

module RoundedRect(width=5, length=5, r=2, $fn=50) {
    height = 3;
    minkowski() {
        cube(size = [length, width, height], center = true);
        cylinder(r=r);
    } 
}
