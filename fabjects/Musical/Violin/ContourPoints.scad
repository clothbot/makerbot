// Contour points

ViolinContour_Num_Pts = 8;

// [x_offset,scale_x,scale_y,steps,height_z]
ViolinContourPoints_Scale_X =[
  [0.0,1.0]
  ,[1.0,1.0]
  ,[2.5,1.0]
  ,[4.0,1.0]
  ,[5.25,1.0]
  ,[7.5,1.0]
  ,[10.5,1.0]
  ,[13.25,1.0]
];

function get_contour_scale_x(x) = lookup(x,ViolinContourPoints_Scale_X);

ViolinContourPoints_Scale_Y =[
  [0.0,1.0]
  ,[1.0,0.6]
  ,[2.5,0.6]
  ,[4.0,0.6]
  ,[5.25,0.6]
  ,[7.5,0.5]
  ,[10.5,0.4]
  ,[13.25,0.35]
];

function get_contour_scale_y(x) = lookup(x,ViolinContourPoints_Scale_Y);

ViolinContourPoints_Steps =[
  [0.0,8]
  ,[1.0,8]
  ,[2.5,8]
  ,[4.0,8]
  ,[5.25,8]
  ,[7.5,8]
  ,[10.5,16]
  ,[13.25,16]
];

function get_contour_steps(x) = round( lookup(x,ViolinContourPoints_Steps) );

ViolinContourPoints_Z_Height =[
  [0.0,0.25]
  ,[1.0,0.5]
  ,[2.5,0.7]
  ,[4.0,0.9]
  ,[5.25,1.1]
  ,[7.5,1.3]
  ,[10.5,1.5]
  ,[13.25,1.55]
];

function get_contour_z_height(x) = lookup(x,ViolinContourPoints_Z_Height);

