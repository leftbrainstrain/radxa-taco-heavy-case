
//translate([0,50,0])
//square([23,14]);

// 15.0-10.2 = 4.8

hdmiTopWidth=15.0;
hdmiBottomWidth=hdmiTopWidth*0.68;
hdmiHeight=hdmiTopWidth*0.36;
hdmiDepth=10.8;

translate([0,hdmiDepth,0])
rotate([90,0,0])
linear_extrude(hdmiDepth)
polygon(points=[
    [0,hdmiHeight]
    ,[hdmiTopWidth,hdmiHeight]
    ,[hdmiTopWidth,hdmiHeight*0.3]
    ,[hdmiTopWidth-(hdmiTopWidth-hdmiBottomWidth)/2,0]
    ,[(hdmiTopWidth-hdmiBottomWidth)/2,0]
    ,[0,hdmiHeight*0.3]
    ]);
