
include <radxa-taco-v1.3.20220711.scad>;
include <radxa-taco-case-variables.scad>;
include <radxa-taco-case-base.scad>;
include <radxa-taco-case-drive-tray.scad>;
include <radxa-taco-case-baseplate.scad>;
include <radxa-taco-case-side-shroud.scad>;
include <radxa-taco-case-upper.scad>;

margin = 0.1;
caseLateralThickness = 2.0;

// drive cage
module radxa_taco_drive_cage() {
    difference() {
        color("SlateGray")
        translate([0,0,0])
        union() {
            // supports
            union() {
                /*
                for(supZ = [0:2:98]) {
                    for(supY = [5:2:81]) {
                        translate([0,supY+0.0,supZ+0.0]) cube([118,0.4,0.4]);
                        //translate([0,supY+0.4,supZ+0.6]) cube([118,0.4,0.4]);
                        //translate([0,supY+0.8,supZ+1.2]) cube([118,0.4,0.4]);
                        //translate([0,supY+1.2,supZ+1.8]) cube([118,0.4,0.4]);
                        //translate([0,supY+1.6,supZ+0.4]) cube([118,0.4,0.4]);
                        translate([0,supY+2.0,supZ+1.0]) cube([118,0.4,0.4]);
                        translate([0,supY+2.4,supZ+1.6]) cube([118,0.4,0.4]);
                        translate([0,supY+2.8,supZ+0.2]) cube([118,0.4,0.4]);
                        translate([0,supY+3.2,supZ+0.8]) cube([118,0.4,0.4]);
                        translate([0,supY+3.6,supZ+1.4]) cube([118,0.4,0.4]);
                    };
                };
                */
            };

            difference() {
                /*
                // outer surface
                linear_extrude(height=supportTopHeight-boardBottomClearance) {
                    color("DarkGray")
                    translate([cornerRadius,cornerRadius,0.0]) {
                        minkowski() {
                                square([boardWidth-cornerRadius*2+5.0
                                    ,boardLength-cornerRadius*2]);
                            circle(r=cornerRadius,$fn=36);
                        }
                    };
                };
                */
                
                union() {
                    linear_extrude(height=hddWidth+1.0) {
                        color("DarkGray")
                        translate([cornerRadius,cornerRadius,0.0]) {
                            minkowski() {
                                square([boardWidth-cornerRadius*2+4.0
                                    ,boardLength-cornerRadius*2]);
                                circle(r=cornerRadius,$fn=36);
                            }
                        };
                    };
                };
                
                /*
                translate([0,0,7]) {
                    cube([120,120,110]);
                };
                */
                /*
                translate([0,0,0]) {
                    cube([120,boardLength/2,120]);
                };
                */
                
                /*
                // screw holes in baseplate
                translate([0.0+caseLateralThickness
                    ,0.0
                    ,0.0])
                union() {
                    // holes to insert screws
                    //translate([101.31,23.15+m25standHoleRadius,0.0])
                    //    cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    translate([16.88,23.00+m25standHoleRadius,-tinyLittleSmidgeon])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    rotate([2.0,2.0,0])
                        translate([2.03,79.86+m25standHoleRadius,-3.0])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    rotate([-2.0,0,0])
                        translate([108.69,80.01+m25standHoleRadius,-tinyLittleSmidgeon])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                };
                */

                // screw holes in baseplate
                translate([0.0+caseLateralThickness
                    ,0.0
                    ,0.0])
                union() {
                    // holes to insert screws
                    //translate([101.31,23.15+m25standHoleRadius,0.0])
                    //    cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    translate([16.88,23.00+m25standHoleRadius,-tinyLittleSmidgeon])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    rotate([2.0,2.0,0])
                        translate([2.03,79.86+m25standHoleRadius,-3.0])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                    rotate([-2.0,0,0])
                        translate([108.69,80.01+m25standHoleRadius,-tinyLittleSmidgeon])
                        cylinder(h=50.0,d1=m25screwHeadDiameter,d2=m25screwHeadDiameter/4,$fn=16);
                };
                
                // SATA drive trays
                translate([-driveTrayVerticalThickness-sataConnectorVerticalMargin+5.6
                        ,7.5
                        ,hddWidth+tinyLittleSmidgeon+1.0])
                union() {
                    translate([0,0,0])
                    rotate([0,90,0])
                    radxa_taco_drive_tray_blank();
                    
                    translate([21.2,0,0])
                    rotate([0,90,0])
                    radxa_taco_drive_tray_blank();
                    
                    translate([42.8,0,0])
                    rotate([0,90,0])
                    radxa_taco_drive_tray_blank();

                    translate([64.4,0,0])
                    rotate([0,90,0])
                    radxa_taco_drive_tray_blank();

                    translate([86.2,0,0])
                    rotate([0,90,0])
                    radxa_taco_drive_tray_blank();
                };
                
                // air holes
                // SATA 1 bottom air holes, for bottom of drive
                //translate([2.9,20,-4.7])
                translate([boardWidth-111.8,20,-4.7])
                union() {
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
                    
                    translate([0,0,90])
                    cylinder(h=20,r=0.75,$fn=12);
                    
                    translate([0,10,90])
                    cylinder(h=20,r=0.75,$fn=12);
                    
                    translate([0,20,90])
                    cylinder(h=20,r=0.75,$fn=12);
                    
                    translate([0,30,90])
                    cylinder(h=20,r=0.75,$fn=12);
                    
                    translate([0,40,90])
                    cylinder(h=20,r=0.75,$fn=12);
                    
                    translate([0,50,90])
                    cylinder(h=20,r=0.75,$fn=12);
                };
                
                // small screw holes to attach upper
                translate([22.5,8.8,95.28+tinyLittleSmidgeon])
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
                
                // small screw holes to attach upper
                translate([43.8,8.8,95.28+tinyLittleSmidgeon])
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
                
                // small screw holes to attach upper
                translate([65.5,8.8,95.28+tinyLittleSmidgeon])
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
                
                // small screw holes to attach upper
                translate([87.2,8.8,95.28+tinyLittleSmidgeon])
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
                
                // small screw holes to attach upper
                translate([108.7,8.8,95.28+tinyLittleSmidgeon])
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
                
                // heat sink for RTL8125B (8.7 x 8.7 x 5)
                translate([56.2+(margin*2),31.0-(margin*2),-3.0]) {
                    color("Black")
                        cube([10.7+(margin*4),10.7+(margin*4),7.0]);
                };
                
                // cavity for 12V fan wire
                translate([boardWidth+(margin),3.0-(margin*2)+tinyLittleSmidgeon,0-margin]) {
                    cube([4+(margin*2),2+(margin*2),200]);
                };
            };
        };
        
        // central area
        union()
        {
            
            // left side opening
            translate([-0.1,11.1,6]) {
                cube([10,hddLength+(2*margin),86]);
            };
            
            // right side opening
            translate([106.60-tinyLittleSmidgeon,11.1,6]) {
                cube([11.13+2*tinyLittleSmidgeon,hddLength+(2*margin),86]);
            };
            
            {
                //translate([20,11.1,6]) {
                //    cube([80,hddLength+(2*margin),86]);
                //};
                //translate([20,11.1,6]) {
                translate([10,10-margin,6]) {
                    rotate([0,90,0])
                    //translate([-66,20,0])
                    translate([-66,20.20+tinyLittleSmidgeon,0])
                    minkowski() {
                        cylinder(h=1,r=20,$fn=64);
                        cube([46,hddLength-2*20+margin+0.099-tinyLittleSmidgeon,86-1]);
                    };
                };
            };
        };
        
        
        // top area occlusion
        //translate([0,0,99.5]) {
        //    cube([120,120,120]);
        //};
        
        // occlusion filter for test prints -- SATA1 vertical section only
        //translate([24.3,-tinyLittleSmidgeon,-tinyLittleSmidgeon]) {
        //    cube([120,120,120+2*tinyLittleSmidgeon]);
        //};
        
        // occlusion filter for test prints -- SATA5 vertical section only
        //translate([-35.0,-1,-20]) {
        //    cube([120,120,130]);
        //};
        
        // occlusion filter for test prints -- baseplate plus 5mm above
        //translate([-1,-1,5]) {
        //    cube([120,120,120]);
        //};

        
    }; // end difference

    // drive baseplate
    translate([0,0,-(supportTopHeight-boardBottomClearance)])
    union() {
        color("LightBlue")
        difference() {
            radxa_taco_baseplate();
            
            // occlusion filter for test prints -- SATA1 vertical section only
            //translate([24.3,-tinyLittleSmidgeon,-17]) {
            //    cube([120,120,120]);
            //};
            
            // occlusion filter for test prints -- SATA5 vertical section only
            //translate([-35.0,-1,-20]) {
            //    cube([120,120,120]);
            //};
            
        };
        
    };
};

/*
//translate([-caseLateralThickness,-caseLateralThickness,100])
translate([-caseLateralThickness,-caseLateralThickness,120])
//translate([0,0,380])
{
    color("Pink")
    translate([boardWidth+caseLateralThickness+5.5,0,30])
    rotate([0,180,0]) {
        radxa_taco_lid();
    }
};
*/

/*
translate([-caseLateralThickness,-caseLateralThickness,101.02])
//translate([-caseLateralThickness,-caseLateralThickness,120])
//translate([0,0,340])
{
    color("Pink")
    radxa_taco_upper();
};
*/

/*
translate([-caseLateralThickness,-caseLateralThickness,-10.55])
//translate([0,0,220])
rotate([0,0,0]) {
    color("Orange")
    radxa_taco_shroud();
};
*/

/*
//translate([0,0,105])
translate([0,0,1.0])
{
    // SATA drive trays
    color("Yellow")
    union() {
        
        translate([6.2-driveTrayVerticalThickness-sataConnectorVerticalMargin,8.7,hddWidth+0.01])
        rotate([0,90,0])
        radxa_taco_drive_tray();
        
        translate([27.4-driveTrayVerticalThickness-sataConnectorVerticalMargin,8.7,hddWidth+0.01])
        rotate([0,90,0])
        radxa_taco_drive_tray();
        
        translate([49.0-driveTrayVerticalThickness-sataConnectorVerticalMargin,8.7,hddWidth+0.01])
        rotate([0,90,0])
        radxa_taco_drive_tray();

        translate([70.6-driveTrayVerticalThickness-sataConnectorVerticalMargin,8.7,hddWidth+0.01])
        rotate([0,90,0])
        radxa_taco_drive_tray();

        translate([92.4-driveTrayVerticalThickness-sataConnectorVerticalMargin,8.7,hddWidth+0.01])
        rotate([0,90,0])
        radxa_taco_drive_tray();
    };
};
*/

/*
//translate([boardWidth,0,-boardHeight-boardBottomClearance])
translate([boardWidth,0,-boardHeight-boardBottomClearance])
rotate([180,0,180]) {
    radxa_taco_board();
};
*/


/*
//translate([-caseLateralThickness,-caseLateralThickness,-50.55])
translate([-caseLateralThickness,-caseLateralThickness,-28.8])
//translate([0,0,-65])
rotate([0,0,0]) {
    color("LightGreen")
    radxa_taco_base();
};
*/

//radxa_taco_drive_cage();
