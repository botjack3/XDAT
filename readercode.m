%%Import data using allegoXDatFileReader
    %check directory
    dir
    
        % . 
        % ..
        % data1.xdat.json      
        % data1.xdat      
        % data1.xdat 
        
    %Create the reader
    reader = allegoXDatFileReader;
    
    datasource = 'data1';
    
        reader.getAllegoXDatTimeRange(datasource);
        
    %Import all the signals with timestamps from 1 through 600 seconds
    signalStruct = reader.getAllegoXDatAllSigs(datasource, [1 600])



%%Simple splot to show the specific channel

        %To plot channel 19 for the entire duration of the data
            plot(signalStruct.timeSamples, signalStruct.signals(19, :));
            xlabel('Time');
            ylabel('Signal Amplitude');
            title('Channel 19');
        
        %To plot the entire duration of the signals for channels 18 to 25
            plot(signalStruct.timeSamples, signalStruct.signals(18:25, :)');

%To count the number of spikes oever specifc threshold
        % Define the signal for channel 19
        signal_ch19 = signalStruct.signals(19, :);
        threshold = 5;
        above_threshold = signal_ch19 > threshold;
        
        % Identify where the signal rises above the threshold (a spike starts)
        spike_starts = find(diff(above_threshold) == 1);
        
        % Count the number of spikes
        num_spikes = length(spike_starts);
        fprintf('Number of spikes above %d: %d\n', threshold, num_spikes);

%%draw histogram

        %Step 1 Dectect Spikes
        fs = 30000; % sampling rate (Hz)
        time = (0:length(signal_ch19)-1) / fs; % Time in seconds
        spike_times = time(spike_starts); % Extract the spike times
        
        %Step 2 Basic Histogram
        histogram(spike_times, 'BinWidth', 0.1); % Bin width of 0.1 seconds
        xlabel('Time (s)');
        ylabel('Spike Count');
        title('Histogram of Spikes vs. Time');
        grid on;
        
        %or Step 2 Advanced Histogram (Custom Bins)
        bin_edges = 0:0.1:max(time); % Bins every 0.1 seconds
        histogram(spike_times, bin_edges);
        xlabel('Time (s)');
        ylabel('Spike Count');
        title('Histogram of Spikes vs. Time (Custom Bins)');
        grid on;

