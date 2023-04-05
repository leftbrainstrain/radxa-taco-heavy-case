
include <radxa-taco-case-variables.scad>;
//include <laptop-hard-disk-15mm.scad>;

margin = 0.1;

driveTrayVerticalThickness = 2.0;
driveTrayLateralThickness = 2.0;

// left side of SATA1 to right side of SATA1 = 3.5mm
// left side of SATA1 to right side of SATA2 = 24.6mm - 3.5*2 = 17.6
// left side of SATA1 to right side of SATA3 = 46.2mm - 3.5*3 = 35.7 /2 = 17.85
// left side of SATA1 to right side of SATA4 = 67.8mm - 3.5*4 = 53.8 /3 = 17.93
// left side of SATA1 to right side of SATA5 = 89.2mm - 3.5*5 = 71.7 /4 = 17.93

// left side of SATA2 to right side of SATA2 = 3.5mm
// left side of SATA2 to right side of SATA3 = 25.0mm - 3.5*2 = 18.0
// left side of SATA2 to right side of SATA4 = 46.5mm - 3.5*3 = 36.0 /2 = 18.0
// left side of SATA2 to right side of SATA5 = 68.0mm - 3.5*4 = 54.0 /3 = 18.0

// left side of SATA3 to right side of SATA3 = 3.5mm
// left side of SATA3 to right side of SATA4 = 24.8mm - 3.5*2 = 17.8
// left side of SATA3 to right side of SATA5 = 46.4mm - 3.5*3 = 35.9 /2 = 17.95

// left side of SATA4 to right side of SATA4 = 3.4mm
// left side of SATA4 to right side of SATA5 = 24.9mm - 3.5*2 = 17.9

// left side of SATA5 to right side of SATA5 = 3.5mm

// 24.6 - 3.4*2 = 24.6 - 6.8 = 17.8

// screw hole 1.5mm above bottom
// screw hole 2.5mm below top
// screw hole 2.2mm ID
// laptop 6.3mm high
// 1.5+2.5+2.2 = 6.2

// HDD in SATA1

// 4.188"/106.4mm from buttom
//   106.4 - 100.0 - 1.8 = 4.6
// 3.17"/80.5mm from near
//   80.5-69.9 = 10.6
// 0.75 = X-offset of drive from SATA port
//translate([108.0-0.75,10.6,-sataDriveClearance-hddWidth])
//rotate([0,-90,0])

module radxa_taco_drive_tray() {
    difference() {
        union() {
            // bottom side
            cube([hddWidth,hddLength+2*driveTrayLateralThickness,driveTrayVerticalThickness]);
            
            // far side
            cube([hddWidth,driveTrayLateralThickness,hddHeight+driveTrayLateralThickness]);
            
            // near side
            translate([0,hddLength+driveTrayLateralThickness,0])
                cube([hddWidth,driveTrayLateralThickness,hddHeight+driveTrayLateralThickness]);
            
            // left side
            translate([-driveTrayLateralThickness,0,0])
                cube([driveTrayLateralThickness
                        ,hddLength+(2*driveTrayVerticalThickness)
                        ,15.0+driveTrayLateralThickness]);
            
            // handle
            translate([-10,10,5.0]) {
                cube([10
                        ,hddLength+(2*driveTrayVerticalThickness)-(10*2)
                        ,driveTrayVerticalThickness]);
            };
        };
        
        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius+driveTrayLateralThickness,-tinyLittleSmidgeon])
        {
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+(2*tinyLittleSmidgeon),r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };
        
        // bottom right
        translate([hddWidth-12.3-hddScrewHoleRadius,-tinyLittleSmidgeon,hddScrewHoleRadius+1.5+driveTrayVerticalThickness-tinyLittleSmidgeon])
        {
            rotate([-90,0,0])
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };
        
        // bottom left
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius+driveTrayLateralThickness-tinyLittleSmidgeon,-tinyLittleSmidgeon])
        {
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };
        
        // bottom left
        translate([8.0+hddScrewHoleRadius,-tinyLittleSmidgeon,hddScrewHoleRadius+1.5+driveTrayVerticalThickness-tinyLittleSmidgeon])
        {
            rotate([-90,0,0])
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius+driveTrayLateralThickness,-tinyLittleSmidgeon])
        {
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };

        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength+2*driveTrayLateralThickness+tinyLittleSmidgeon,hddScrewHoleRadius+1.5+driveTrayVerticalThickness])
        {
            rotate([90,0,0])
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };

        // top left
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius+driveTrayLateralThickness+tinyLittleSmidgeon,-tinyLittleSmidgeon])
        {
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };
        
        // top left
        translate([8.0+hddScrewHoleRadius,hddLength+2*driveTrayLateralThickness+tinyLittleSmidgeon,hddScrewHoleRadius+1.5+driveTrayVerticalThickness])
        {
            rotate([90,0,0])
            union() {
                translate([0,0,1.2])
                    cylinder(h=8.8+tinyLittleSmidgeon,r=hddScrewHoleRadius,$fn=16);
                cylinder(h=1.2+tinyLittleSmidgeon,r1=m3ScrewHeadRadius,r2=hddScrewHoleRadius,$fn=16);
            };
        };
        
        translate([15,15,-tinyLittleSmidgeon]) {
            minkowski() {
                cylinder(h=driveTrayVerticalThickness,r1=4,r2=2,$fn=16);
                cube([hddWidth-(15*2),hddLength+(2*driveTrayVerticalThickness)-(15*2),0.02]);
            };
        };
        
        // air vent holes
        translate([+tinyLittleSmidgeon,17,12])
        union() {
            translate([0,0,0])
            rotate([0,-90,0])
            cylinder(h=driveTrayVerticalThickness+(2*tinyLittleSmidgeon),r=1.5,$fn=12);
            
            translate([0,10,0])
            rotate([0,-90,0])
            cylinder(h=driveTrayVerticalThickness+(2*tinyLittleSmidgeon),r=1.5,$fn=12);
            
            translate([0,20,0])
            rotate([0,-90,0])
            cylinder(h=driveTrayVerticalThickness+(2*tinyLittleSmidgeon),r=1.5,$fn=12);
            
            translate([0,30,0])
            rotate([0,-90,0])
            cylinder(h=driveTrayVerticalThickness+(2*tinyLittleSmidgeon),r=1.5,$fn=12);
            
            translate([0,40,0])
            rotate([0,-90,0])
            cylinder(h=driveTrayVerticalThickness+(2*tinyLittleSmidgeon),r=1.5,$fn=12);
        };

    };
};

module radxa_taco_drive_tray_blank() {
    
    translate([0,0,0]) {
        union() {
            // bottom side
            cube([hddWidth+(2*margin)+(2*tinyLittleSmidgeon)+1.0
                    ,hddLength+(2*driveTrayLateralThickness)+(2*sataConnectorLateralMargin)
                    ,hddHeight+driveTrayVerticalThickness+(2*sataConnectorVerticalMargin)]);
            
            translate([0
                    ,caseVerticalThickness+sataConnectorLateralMargin
                    ,caseVerticalThickness])
                cube([hddWidth+(2*margin)+1.0
                        ,hddLength+(2*margin)
                        ,hddHeightClearance+(4*margin)]);
            
            // near side
            //cube([hddWidth,caseLateralThickness,hddHeight+caseLateralThickness]);
            
            // far side
            //translate([0,hddLength+caseLateralThickness,0])
            //    cube([hddWidth,caseLateralThickness,hddHeight+caseLateralThickness]);
            
            // left side
            translate([-caseVerticalThickness-(2*margin)-2,0,0])
                cube([caseVerticalThickness+(2*margin)+2
                        ,hddLength+(2*caseVerticalThickness)+1.2
                        ,hddHeightClearance+caseVerticalThickness+(4*margin)]);
            
            // handle
            //translate([-10,5,5.0]) {
            //    cube([10
            //            ,hddLength+(2*caseVerticalThickness)-(10*2)
            //            ,caseVerticalThickness]);
            //};
        };
    };
};


//translate([0,driveTrayVerticalThickness,driveTrayVerticalThickness]) {
//    laptop_hard_disk_15mm();
//};

//radxa_taco_drive_tray();
//radxa_taco_drive_tray_blank();
