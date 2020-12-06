% MATLAB controller for Webots
% File:          my_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
motor_left = wb_robot_get_device('motor_left');
motor_right = wb_robot_get_device('motor_right');

ds = wb_robot_get_device('ds');

wb_motor_set_position(motor_left,Inf);
wb_motor_set_velocity(motor_left,1);
wb_motor_set_position(motor_right,Inf);
wb_motor_set_velocity(motor_right,1);

wb_distance_sensor_enable(ds, TIME_STEP);
% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1
  distance = wb_distance_sensor_get_value(ds);
  
  disp(distance);

  if distance < 100
    wb_motor_set_velocity(motor_left,0);
    wb_motor_set_velocity(motor_right,0);
  end
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
