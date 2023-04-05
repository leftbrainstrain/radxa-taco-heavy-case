
// 0.039"/1.0mm case thickness

// opening 1.265"/32.1mm diameter

// diameter from opening to outside of case
// 0.224"
// 0.290" 0.066
// 0.370" 0.080
// 0.425" 0.055 / 10.8mm

// 1.872"/47.5mm wide
//   ==> spec says 51.5+-0.5
// 2.010"/51.1mm long
//   ==> spec says 51.5+-0.5
// 0.597"/15.2mm thick
//   ==> spec says 15.0+-0.3

// 0.372"(r)-0.225"(l) = 0.147"/3.7mm right offset from motor spindle
// 0.428"(u)-0.293"(d) = 0.135"/3.4mm up offset from motor spindle

module fan5015blower() {
    translate([26.75,22.05,0])
    union() {
        fanAssemblyHeight = 15.0;
        fanAssemblyCaseThickness = 1.0;
        
        fanAssemblyCaseProbableDiameter = 47.5;
        fanAssemblyCaseProbableRadius = fanAssemblyCaseProbableDiameter/2.0;
        
        attachmentHoleCenterDistance = 57.0;
        attachmentHoleDiameter = 4.6;
        
        turboOffsetX = 3.7;
        turboOffsetY = 3.4;
        
        intakeHoleDiameter = 32.1;
        
        exhaustOuterLength = 19.3;
        exhaustOuterOffsetX = -3.0;
        exhaustOuterOffsetY = intakeHoleDiameter/2.0+10.8-exhaustOuterLength;
        
        exhaustInnerLength = exhaustOuterLength - (2.0*fanAssemblyCaseThickness);
        
        
        
        difference() {
            union() {
                hull() {
                    translate([turboOffsetX/2,turboOffsetY/2,0])
                        cylinder(h=fanAssemblyHeight,d=fanAssemblyCaseProbableDiameter,$fn=64);
                    //translate([-47.5/4-3.0,32.1/2.0+10.8-19.3,0])
                    //    cube([47.5/4.0+3.0,19.3,15.2]);
                    translate([-fanAssemblyCaseProbableRadius/2+exhaustOuterOffsetX
                            ,exhaustOuterOffsetY
                            ,0])
                        cube([fanAssemblyCaseProbableRadius/2-exhaustOuterOffsetX
                                ,exhaustOuterLength
                                ,fanAssemblyHeight]);
                };
                
                // edge of blower is 0.118"/3.0mm offset from rightmost side of blower
                // blower hole OD is 0.759"/19.3mm long
                translate([-fanAssemblyCaseProbableRadius+exhaustOuterOffsetX,exhaustOuterOffsetY,0])
                    cube([fanAssemblyCaseProbableRadius-exhaustOuterOffsetX,exhaustOuterLength,fanAssemblyHeight]);
                

                // mounting holes
                // OD 0.250" = 6.3mm
                // ID 0.196" = 5.0mm
                //   ==> spec says 4.6mm
                // thickness 0.038"/1.0mm
                // hole one (up-right) 0.462"/11.7mm from ID to opening
                // hole two (down-left) 0.308"/7.8mm from ID to opening
                // ID1-ID2 distance 2.050"/52.1mm
                //   ==> spec says 57.0-4.6 = 52.4mm
                translate([turboOffsetX/2,turboOffsetY/2,0])
                rotate([0,0,-45])
                difference() {
                    hull() {
                        translate([0,attachmentHoleCenterDistance/2,0])
                            cylinder(h=fanAssemblyHeight,d=6.3,$fn=16);
                        translate([0,-attachmentHoleCenterDistance/2,0])
                            cylinder(h=fanAssemblyHeight,d=6.3,$fn=16);
                    }
                    
                    translate([0,attachmentHoleCenterDistance/2.0,-0.1])
                        cylinder(h=fanAssemblyHeight+0.2,d=attachmentHoleDiameter,$fn=16);
                    translate([0,-attachmentHoleCenterDistance/2.0,-0.1])
                        cylinder(h=fanAssemblyHeight+0.2,d=attachmentHoleDiameter,$fn=16);
                }
                
            }
            
            // exhaust hole
            translate([-fanAssemblyCaseProbableRadius+exhaustOuterOffsetX-fanAssemblyCaseThickness
                    ,exhaustOuterOffsetY+fanAssemblyCaseThickness
                    ,fanAssemblyCaseThickness])
                cube([fanAssemblyCaseProbableDiameter/2.0-exhaustOuterOffsetX-(2*fanAssemblyCaseThickness)
                        ,exhaustOuterLength-(2*fanAssemblyCaseThickness)
                        ,fanAssemblyHeight-(2*fanAssemblyCaseThickness)]);
            
            hull() {
                // inside cavity
                translate([turboOffsetX/2,turboOffsetY/2,fanAssemblyCaseThickness])
                    cylinder(h=fanAssemblyHeight-(2*fanAssemblyCaseThickness)
                            ,d=fanAssemblyCaseProbableDiameter-(2*fanAssemblyCaseThickness),$fn=16);
                translate([-fanAssemblyCaseProbableRadius/2+exhaustOuterOffsetX-fanAssemblyCaseThickness
                        ,exhaustOuterOffsetY+fanAssemblyCaseThickness
                        ,fanAssemblyCaseThickness])
                    cube([fanAssemblyCaseProbableRadius/2-exhaustOuterOffsetX-(2*fanAssemblyCaseThickness)
                            ,exhaustOuterLength-(2*fanAssemblyCaseThickness)
                            ,fanAssemblyHeight-(2*fanAssemblyCaseThickness)]);
            };
            
            // intake hole
            translate([0.0,0.0,fanAssemblyCaseThickness])
                cylinder(h=fanAssemblyHeight-fanAssemblyCaseThickness+0.1,d=intakeHoleDiameter);
        }

        // 0.940"/23.9mm fan motor cover diameter
        // 0.352"/8.9mm from cover to base of rotor
        // 0.085"/2.2mm from cover base to fan motor cover
        translate([0.0,0.0,fanAssemblyHeight-8.9-2.2])
            cylinder(h=8.9,d=23.9);

    };
};