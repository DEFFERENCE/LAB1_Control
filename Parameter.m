function Process_data = replaceDataInRangeForIndexes(data, srcIdx1List, srcIdx2, timeRange)
    % Copy the original data structure to Process_data
    Process_data = data;
    
    % Loop through all specified first indices (X in {X}{5})
    for i = 1:length(srcIdx1List)
        srcIdx1 = srcIdx1List(i); % Extract scalar index
        
        
        % Get original Time and Data values
        originalTime = data{srcIdx1}{srcIdx2}.Values.Time;
        originalData = data{srcIdx1}{srcIdx2}.Values.Data;
        
        % Find indices within the specified time range
        replaceIdx = (originalTime >= timeRange(1)) & (originalTime <= timeRange(2));
        
        % Replace Data values with 0 in the specified range
        modifiedData = originalData; % Copy original data
        modifiedData(replaceIdx) = 0; % Set values in range to 0
        
        % Store modified data in Process_data
        Process_data{srcIdx1}{srcIdx2}.Values.Time = originalTime; % Keep original Time
        Process_data{srcIdx1}{srcIdx2}.Values.Data = modifiedData; % Store modified Data
        
        fprintf('Data in range [%.2f, %.2f] replaced with 0 in Process_data{%d}{%d}.\n', ...
            timeRange(1), timeRange(2), srcIdx1, srcIdx2);
    end
end

% Define time range and first indices (multiple {X}{5})
%timeRange = [0, 1];
% firstIndices = 1:15; % Apply to data{1}{5} through data{15}{5}
firstIndices = 1:3;
% Process data
%Step_Process_data = replaceDataInRangeForIndexes(data, 1:3, 5, [0,1]);
%Ramp_Process_data = replaceDataInRangeForIndexes(data, 4:6, 5, [0,1.25]);
%Ramp2_Process_data = replaceDataInRangeForIndexes(data, 6, 5, [0,1]);
%Sine_Process_data = replaceDataInRangeForIndexes(data, 7, 5, [0,0.1]);
Stair_step_Process_data = replaceDataInRangeForIndexes(data, 18:20, 5, [0,2]);
%Sine_ramp_Process_data = replaceDataInRangeForIndexes(data, 13:15, 5, [0,0.75]);
%Chirb_Process_data = replaceDataInRangeForIndexes(data, 1:3, 4, [0,0.2]);
