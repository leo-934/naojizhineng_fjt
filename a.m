% Step 1: Load the dataset file
data = load('indy_20170131_02.mat');

% Step 2: Determine the variable for PCA
input_data = data.wf{1, 1}; % or data.spikes

% Step 3: Preprocess the input data if needed

% Step 4: Perform PCA
num_components = 2; % Set the number of principal components to retain
[coefficients, scores] = pca(input_data, 'NumComponents', num_components);

% Step 5: Optional - Visualize or further analyze the reduced data
scatter(scores(:, 1), scores(:, 2)); % Scatter plot of the first two principal components

% Additional analysis or visualization code can be added here
wf = data.wf{1, 1};
% Step 3: Apply K-means algorithm
k = 5; % Set the number of clusters
[idx, centroids] = kmeans(wf, k);

% Step 4: Optional - Visualize or evaluate the clustering result
scatter3(wf(:, 1), wf(:, 2), wf(:, 3), [], idx);
xlabel('Feature 1');
ylabel('Feature 2');
zlabel('Feature 3');
title('K-means Clustering Result');

% Step 2: Select a row to plot
row_index = 1; % Choose the row index to plot

% Step 3: Plot the waveform
figure;
plot(wf(row_index, :));
xlabel('Time');
ylabel('Amplitude');
title('Waveform');