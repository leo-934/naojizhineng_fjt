data = load('indy_20170131_02.mat');
wf = data.wf{1, 1};
% Step 2: Select the columns for Ground truth
ground_truth = wf(:, 2:5); % Assuming columns wf2-5 are the Ground truth labels

% Step 3: Apply K-means algorithm
k = 5; % Set the number of clusters
[idx, centroids] = kmeans(wf, k);

% Step 4: Evaluate the clustering result
% Calculate ARI
ARI = calculateARI(ground_truth, idx);

% Calculate NMI
NMI = calculateNMI(ground_truth, idx);

% Step 5: Display the evaluation results
disp(['Adjusted Rand Index (ARI): ' num2str(ARI)]);
disp(['Normalized Mutual Information (NMI): ' num2str(NMI)]);

% Function to calculate Adjusted Rand Index (ARI)
function ARI = calculateARI(ground_truth, idx)
    % Convert ground truth and clustering results to contingency table
    num_gt = max(ground_truth);
    num_clusters = max(idx);
    contingency = zeros(num_gt, num_clusters);
    
    for i = 1:numel(ground_truth)
        contingency(ground_truth(i), idx(i)) = contingency(ground_truth(i), idx(i)) + 1;
    end
    
    % Rest of the code remains the same
end

% Function to calculate Normalized Mutual Information (NMI)
function NMI = calculateNMI(ground_truth, idx)
    % Convert ground truth and clustering results to contingency table
    num_gt = max(ground_truth);
    num_clusters = max(idx);
    contingency = zeros(num_gt, num_clusters);
    
    for i = 1:numel(ground_truth)
        contingency(ground_truth(i), idx(i)) = contingency(ground_truth(i), idx(i)) + 1;
    end
    
    % Rest of the code remains the same
end