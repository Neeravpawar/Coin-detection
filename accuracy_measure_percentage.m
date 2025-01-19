function accuracy_measure_percentage(test_results, correct_counts)
% ACCURACY_MEASURE_PERCENTAGE Calculates the accuracy of coin detection.
%   accuracy_measure_percentage(test_results, correct_counts)
%   Inputs:
%       test_results    - Detected counts of coins (matrix of results from "ans").
%       correct_counts  - Ground truth counts of coins (matrix of "correct").
%   Outputs:
%       Displays accuracy percentage and histogram of differences.

    % Validate inputs
    if length(test_results) ~= length(correct_counts)
        error('The lengths of test_results and correct_counts must match.');
    end

    % Calculate absolute differences
    differences = abs(test_results - correct_counts);

    % Calculate overall accuracy
    total_coins = sum(correct_counts(:));
    correctly_detected = total_coins - sum(differences(:));
    accuracy_percentage = (correctly_detected / total_coins) * 100;

    % Display the accuracy percentage
    fprintf('Accuracy: %.2f%%\n', accuracy_percentage);

    % Create histogram of differences
    figure;
    histogram(differences, 'BinWidth', 1);
    title('Histogram of Differences in Detected and Correct Coin Counts');
    xlabel('Difference');
    ylabel('Frequency');

    % Display differences for debugging or analysis
    disp('Differences:');
    disp(differences);
end
