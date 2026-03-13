function spike_matrix = generate_correlated_spiketrains(num_trains, total_points, num_spikes, target_corr)
    % Generates correlated binary spike trains (0s and 1s).
    % The correlation is approximate, achieved via a common input method.
    
    % Calculate the desired mean rate (probability of a spike in a bin)
    p = num_spikes / total_points;
    
    % This is a simplified method. A more robust way involves latent Gaussian 
    % variables, but this demonstrates the principle.
    % The challenge with binary data is that the exact correlation can vary.

    % Generate base independent random processes (Gaussian for simplicity here)
    % A proper implementation for binary correlation might use different methods (e.g., Ising model)
    % This simplified version inserts common spikes into independent trains
    
    spike_matrix = zeros(num_trains, total_points);
    
    % Generate 'common' spikes that will be shared across trains
    % Adjust the proportion of common spikes based on the target correlation
    % This is an ad-hoc way to control correlation
    
    % Calculate the required proportion of shared spikes.
    % This is a rough estimate and requires fine-tuning/validation.
    % A target correlation of 0.25 might correspond to roughly 25% shared input
    
    % Let's use a method of shared events
    
    % Number of shared spikes (approximate)
    num_shared = round(p * target_corr * total_points);
    
    % Create a pool of shared spike positions
    shared_spikes_pos = randperm(total_points, num_shared);
    common_input = zeros(1, total_points);
    common_input(shared_spikes_pos) = 1;
    
    for i = 1:num_trains
        % Generate independent spike locations
        independent_spikes_pos = randperm(total_points, num_spikes - nnz(common_input));
        current_train = zeros(1, total_points);
        current_train(independent_spikes_pos) = 1;
        
        % Combine common input with independent spikes
        % Ensure no double counting if a spike lands in the same bin
        spike_matrix(i, :) = current_train | common_input; 
        
        % Re-enforce the exact number of spikes constraint.
        % This step makes achieving exact correlation harder.
        % It's generally better to use a model that ensures both constraints simultaneously.
    end
    
    % Note: The number of spikes might slightly deviate if num_spikes - nnz(common_input) is negative
    % or if independent spikes overlap with common spikes (solved by the '|' operator).
    % The number of spikes will be at least num_shared. 
    % For an exact number of spikes in each train, the generation process needs to be more sophisticated.
end