%{  
This script for prepare data and parameters for parameter estimator.
1. Load your collected data to MATLAB workspace.
2. Run this script.
3. Follow parameter estimator instruction.
%}

% R and L from experiment
motor_R = 3.63;
motor_L = 0.00257;
% Optimization's parameters
motor_Eff = 1;
motor_Ke = 0.05;
motor_J = 0.001;
motor_B = 0.0001;

% Extract collected data
Input = Sine_Process_data{8}{3}.Values.Data;
Time = Sine_Process_data{8}{5}.Values.Time;
Velo = double(Sine_Process_data{8}{5}.Values.Data);
Input = reshape(Input, [1, 10001]);
% Plot 
figure(Name='Motor velocity response')
untitled(Time,Velo,Input);


function untitled(Time,Velo,Input)
plot(Time,Velo,Time,Input)
end