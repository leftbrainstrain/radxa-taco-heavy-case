
hddWidth = 100.0;
hddLength = 69.6;
//hddHeight = 6.5;
hddHeight = 15;
hddCornerRadius = 3.0;
hddScrewHoleRadius = 1.5;

module laptop_hard_disk_15mm() {
    //translate([0,0,-hddWidth])
    //rotate([0,-90,0])
    difference() {

        color("LightGray")
        translate([hddCornerRadius,hddCornerRadius,0]) {
            minkowski() {
                    cube([hddWidth-hddCornerRadius*2
                        ,hddLength-hddCornerRadius*2
                        ,hddHeight/2]);
                cylinder(h=hddHeight/2,r=hddCornerRadius,$fn=24);
            }
        };

        // near right bottom
        translate([hddWidth-12.3-hddScrewHoleRadius,2.4+hddScrewHoleRadius,0]) {
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        };
        
        // near right side
        translate([hddWidth-12.3-hddScrewHoleRadius,0,hddScrewHoleRadius+1.5])
        {
            rotate([-90,0,0]) {
                cylinder(h=6.1,r=hddScrewHoleRadius,$fn=16);
            };
        };

        // near left bottom
        translate([8.0+hddScrewHoleRadius,2.4+hddScrewHoleRadius,0]) {
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        };
        
        // near left side
        translate([8.0+hddScrewHoleRadius,0,hddScrewHoleRadius+1.5]) {
            rotate([-90,0,0]) {
                cylinder(h=6.1,r=hddScrewHoleRadius,$fn=16);
            };
        };

        // far right bottom
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0]) {
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        };
        
        // top right
        translate([hddWidth-12.3-hddScrewHoleRadius,hddLength,hddScrewHoleRadius+1.5])
        {
            rotate([90,0,0]) {
                cylinder(h=6.1,r=hddScrewHoleRadius,$fn=16);
            };
        };

        // far left bottom
        translate([8.0+hddScrewHoleRadius,hddLength-2.4-hddScrewHoleRadius,0]) {
            cylinder(h=6.1,r=hddScrewHoleRadius,$fn=12);
        };
        
        
        // top left
        translate([8.0+hddScrewHoleRadius,hddLength,hddScrewHoleRadius+1.5]) {
            rotate([90,0,0]) {
                cylinder(h=6.1,r=hddScrewHoleRadius,$fn=16);
            };
        };
        
        // SATA plug
        // 7.0mm away from near edge
        // 44.8mm long
        // 6.5mm wide
        // 5.3mm high
        translate([hddWidth-6.5,7.0,0.0]) {
            cube([6.5,44.8,5.3]);
        };
    };
};

