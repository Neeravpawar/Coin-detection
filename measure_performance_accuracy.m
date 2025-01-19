function accuracy = measure_performance_accuracy(ans_values, correct_values)
% MEASURE_PERFORMANCE_ACCURACY Calculates the accuracy of detected coins.
%
%   accuracy = measure_performance_accuracy(ans_values, correct_values)
%
%   Inputs:
%       ans_values     - Matrix of detected coin counts (e.g., from "ans").
%       correct_values - Matrix of actual coin counts ("correct").
%
%   Outputs:
%       accuracy       - Overall accuracy percentage.

    % Validate input dimensions
    if size(ans_values) ~= size(correct_values)
        error('The dimensions of ans_values and correct_values must match.');
    end

    % Calculate the number of correct detections
    correct_detections = sum(sum(ans_values == correct_values));

    % Calculate the total number of coins (ground truth)
    total_coins = numel(correct_values);

    % Calculate accuracy percentage
    accuracy = (correct_detections / total_coins) * 100;

    % Display results
    fprintf('Accuracy: %.2f%%\n', accuracy);

    % Optional: Create a histogram of differences
    differences = abs(ans_values - correct_values);
    figure;
    histogram(differences, 'BinWidth', 1);
    title('Histogram of Differences Between Detected and Correct Values');
    xlabel('Difference');
    ylabel('Frequency');

    % Display differences for debugging
    disp('Differences Between Detected and Correct Values:');
    disp(differences);
end


