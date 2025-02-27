Signal_label = [1:15; zeros(1,15)+16];

Stair_Time_2 = linspace(156,166,8);
Signal_label = Signal_label(:)';  % Flatten into a row vector

% Initialize the starting point
sequence = [];

% Loop to generate numbers in the pattern
for tens = 0:14
    for ones = 0:1
        num = tens*10 + ones*10 + tens*2; % Generate the number based on the pattern
        sequence = [sequence, num];
    end
end
time = sequence;
% Display the sequence
disp(sequence);

