include <fan-5015-blower.scad>;

include <radxa-taco-variables.scad>;
include <radxa-taco-case-variables.scad>;
include <radxa-taco-case-drive-tray.scad>;
include <radxa-taco-case-lid.scad>;
include <sata-laptop-receiver.scad>;

// TODO: beveled edge for insertion of threaded nuts ... seems to work fine without?
// TODO: shroud built into case around vent (keep blower exhaust from leaking back into case)
// TODO: modify fan wire holes to accommodate adding upper after fan already plugged in - DONE
// TODO: add visible numbers next to each drive slot

module radxa_taco_upper() {
    union() {
        difference() {
            translate([0,0,0])
            linear_extrude(35) {
                color("DarkGray")
                translate([caseCornerRadius,caseCornerRadius]) {
                    minkowski() {
                        square([boardWidth
                                    +caseLateralThickness*2
                                    -caseCornerRadius*2
                                    +(2*margin)
                                    +4
                            ,boardLength
                                    +caseLateralThickness*2
                                    -caseCornerRadius*2
                                    +(2*margin)
                            ]);
                        circle(r=caseCornerRadius,$fn=36);
                    };
                };
            };
            
            
            // base inner surface
            translate([caseLateralThickness,caseLateralThickness,caseVerticalThickness])
            linear_extrude(35+0.2) {
                color("DarkGray")
                translate([boardCornerRadius,boardCornerRadius,0]) {
                    minkowski() {
                        square([boardWidth
                                    -boardCornerRadius*2
                                    +(2*margin)
                                    +4
                            ,boardLength
                                    -boardCornerRadius*2
                                    +(2*margin)]);
                        circle(r=boardCornerRadius,$fn=36);
                    };
                };
            };
            
            translate([4.1/2+1.0
                    ,boardLength+caseLateralThickness+margin*2-1.0
                    ,35-4.1+tinyLittleSmidgeon])
                cylinder(h=4.1,d=4.1,$fn=16);
            
            // exhaust hole
            translate([42.90,-tinyLittleSmidgeon,21.0]) {
                cube([16.5,2.52,13.1]);
            };
            
            // SATA drive trays
            translate([caseLateralThickness-0.17,7.5+caseLateralThickness+tinyLittleSmidgeon,-hddWidth-margin])
            union() {
                
                translate([5.8-driveTrayVerticalThickness-sataConnectorVerticalMargin
                        ,0
                        ,hddWidth+tinyLittleSmidgeon])
                rotate([0,90,0])
                radxa_taco_drive_tray_blank();
                
                translate([27.0-driveTrayVerticalThickness-sataConnectorVerticalMargin
                        ,0
                        ,hddWidth+tinyLittleSmidgeon])
                rotate([0,90,0])
                radxa_taco_drive_tray_blank();
                
                translate([48.6-driveTrayVerticalThickness-sataConnectorVerticalMargin
                        ,0
                        ,hddWidth+tinyLittleSmidgeon])
                rotate([0,90,0])
                radxa_taco_drive_tray_blank();

                translate([70.2-driveTrayVerticalThickness-sataConnectorVerticalMargin
                        ,0
                        ,hddWidth+tinyLittleSmidgeon])
                rotate([0,90,0])
                radxa_taco_drive_tray_blank();

                translate([92.0-driveTrayVerticalThickness-sataConnectorVerticalMargin
                        ,0
                        ,hddWidth+tinyLittleSmidgeon])
                rotate([0,90,0])
                radxa_taco_drive_tray_blank();
            };
            
            
            // air holes
            // SATA 1 bottom air holes, for bottom of drive
            //translate([2.9,20,-4.7])
            translate([boardWidth-111.8+caseLateralThickness,20+caseLateralThickness,-4.8])
            union() {
                //translate([0,-10,0])
                //cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,10,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,20,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,30,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,40,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,50,0])
                cylinder(h=20,r=0.75,$fn=12);
            };
            
            
            // small screw holes to attach upper to cage
            translate([22.5+caseLateralThickness,8.8+caseLateralThickness,-tinyLittleSmidgeon])
            union() {
                //translate([0,0.75,0])
                //cylinder(h=5,r=0.75,$fn=12);
                
                translate([0,0.75+1*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+2*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+3*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+4*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                //translate([0,0.75+5*14.5,0])
                //cylinder(h=20,r=0.75,$fn=12);
            };
            
            // small screw holes to attach upper to cage
            translate([43.8+caseLateralThickness,8.8+caseLateralThickness,-tinyLittleSmidgeon])
            union() {
                //translate([0,0.75,0])
                //cylinder(h=5,r=0.75,$fn=12);
                
                translate([0,0.75+1*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+2*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+3*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+4*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                //translate([0,0.75+5*14.5,0])
                //cylinder(h=20,r=0.75,$fn=12);
            };
            
            // small screw holes to attach upper to cage
            translate([65.5+caseLateralThickness,8.8+caseLateralThickness,-tinyLittleSmidgeon])
            union() {
                //translate([0,0.75,0])
                //cylinder(h=5,r=0.75,$fn=12);
                
                translate([0,0.75+1*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+2*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+3*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+4*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                //translate([0,0.75+5*14.5,0])
                //cylinder(h=20,r=0.75,$fn=12);
            };
            
            // small screw holes to attach upper to cage
            translate([87.2+caseLateralThickness,8.8+caseLateralThickness,-tinyLittleSmidgeon])
            union() {
                //translate([0,0.75,0])
                //cylinder(h=5,r=0.75,$fn=12);
                
                translate([0,0.75+1*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+2*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+3*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+4*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                //translate([0,0.75+5*14.5,0])
                //cylinder(h=20,r=0.75,$fn=12);
            };
            
            // small screw holes to attach upper to cage
            translate([108.7+caseLateralThickness,8.8+caseLateralThickness,-tinyLittleSmidgeon])
            union() {
                //translate([0,0.75,0])
                //cylinder(h=5,r=0.75,$fn=12);
                
                translate([0,0.75+1*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+2*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+3*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                translate([0,0.75+4*14.5,0])
                cylinder(h=20,r=0.75,$fn=12);
                
                //translate([0,0.75+5*14.5,0])
                //cylinder(h=20,r=0.75,$fn=12);
            };
            
            // cavity for 12V fan wires
            /*
            translate([boardWidth+caseLateralThickness-1.8
                    ,3.0-margin+caseLateralThickness-0.1
                    ,-tinyLittleSmidgeon]) {
                cube([6,8,caseVerticalThickness+(2*tinyLittleSmidgeon)]);
            };
            */
            translate([boardWidth+caseLateralThickness+0.2
                    ,3.0-margin+caseLateralThickness
                    ,-tinyLittleSmidgeon]) {
                cube([4,2.2,caseVerticalThickness+(2*tinyLittleSmidgeon)]);
            };
            translate([boardWidth+caseLateralThickness-8
                    ,7.6-margin+caseLateralThickness
                    ,-tinyLittleSmidgeon]) {
                rotate([0,0,-25])
                    cube([11,2.2,caseVerticalThickness+(2*tinyLittleSmidgeon)]);
            };
        }; // end difference
        
        // support for nut to attach list to upper
        translate([caseLateralThickness
                ,caseLateralThickness
                ,15])
        difference() {
            translate([0,0,0])
                rotate([-6,6,0])
                translate([0,0,15])cylinder(h=30,d1=2,d2=12,$fn=32,center=true);
            translate([0,0,20])
                translate([0,0,10]) cube([20,20,20+tinyLittleSmidgeon*2],center=true);
            translate([0,-10,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([-10,0,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([2.7,2.7,20-4.1+tinyLittleSmidgeon])
                cylinder(h=4.1,d=4.1,$fn=16);
        };
        
        // support for nut to attach list to upper
        translate([boardWidth+caseLateralThickness+margin*2+4.0
                ,caseLateralThickness
                ,15])
        rotate([0,0,90])
        difference() {
            translate([0,0,0])
                rotate([-6,6,0])
                translate([0,0,15])cylinder(h=30,d1=2,d2=12,$fn=32,center=true);
            translate([0,0,20])
                translate([0,0,10]) cube([20,20,20+tinyLittleSmidgeon*2],center=true);
            translate([0,-10,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([-10,0,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([2.7,2.7,20-4.1+tinyLittleSmidgeon])
                cylinder(h=4.1,d=4.1,$fn=16);
        };
        
        // support for nut to attach list to upper
        translate([boardWidth+caseLateralThickness+margin*2+4.0
                ,boardLength+caseLateralThickness+margin*2
                ,15])
        rotate([0,0,180])
        difference() {
            translate([0,0,0])
                rotate([-6,6,0])
                translate([0,0,15])cylinder(h=30,d1=2,d2=12,$fn=32,center=true);
            translate([0,0,20])
                translate([0,0,10]) cube([20,20,20+tinyLittleSmidgeon*2],center=true);
            translate([0,-10,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([-10,0,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([2.7,2.7,20-4.1+tinyLittleSmidgeon])
                cylinder(h=4.1,d=4.1,$fn=16);
        };
        
        // support for nut to attach list to upper
        translate([caseLateralThickness-1.65
                ,boardLength+caseLateralThickness+margin*2+1.70
                ,15-tinyLittleSmidgeon])
        rotate([0,0,270])
        difference() {
            translate([0,0,0])
                rotate([-7.5,7.5,0])
                translate([0,0,15])cylinder(h=30,d1=2,d2=9,$fn=32,center=true);
            translate([0,0,20])
                translate([0,0,10]) cube([20,20,20+tinyLittleSmidgeon*2],center=true);
            translate([0,-10+0.6,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([-10+0.6,0,0])
                translate([0,0,10]) cube([20,20,30+tinyLittleSmidgeon*2],center=true);
            translate([2.7,2.7,20-4.1+tinyLittleSmidgeon])
                cylinder(h=4.1,d=4.1,$fn=16);
        };
    }; // end union

    //translate([90,36.9,25])
    //rotate([0,180,0])
    //    fan5015blower();
};

//radxa_taco_upper();

/*
color("Blue")
translate([boardWidth+caseLateralThickness+6+margin*2,0.0,37.0+2.0+tinyLittleSmidgeon])
//translate([boardWidth+caseLateralThickness+6+margin*2,0.0,57.0])
rotate([0,180,0])
radxa_taco_lid();
*/
