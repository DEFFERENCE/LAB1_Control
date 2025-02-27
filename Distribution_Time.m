% Extract the data and time
data = out.logsout{1}.Values.Data;
time = out.logsout{1}.Values.Time;

% Define the interval length
interval = 12;  % 12 seconds

% Initialize variables to store segmented data
segmented_data = {};
segmented_time = {};

% Loop to segment the data every 12 seconds
start_idx = 1;
while start_idx <= length(time)
    % Find the index where the time is greater than or equal to (start_time + interval)
    end_idx = find(time >= time(start_idx) + interval - 0.001, 1);
    
    % If no further data is found, set end_idx to the last data point
    if isempty(end_idx)
        end_idx = length(time);
    end
    
    % Slice the data and time for this segment
    segment_data = data(start_idx:end_idx);
    segment_time = time(start_idx:end_idx) - time(start_idx);  % Reset time to 0 for each segment
    
    % Reshape the segment_data to 1D array (flatten the data)
    segment_data = segment_data(:);  % Ensure it's a column vector or reshape it as needed
    
    % Store the segment
    segmented_data{end+1} = segment_data;
    segmented_time{end+1} = segment_time;
    
    % Update the start_idx for the next segment
    start_idx = end_idx + 1;
end

% Optional: Display the segmented data and time
% for i = 1:length(segmented_data)
%     fprintf('Segment %d:\n', i);
%     disp(segmented_time{i});
%     disp(segmented_data{i});
% end
