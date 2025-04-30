# Spike Detection and Signal Analysis Tool for Allego XDAT Files

This MATLAB script provides an interactive command-line tool for loading, filtering, visualizing, exporting, and analyzing electrophysiological recordings from Allego XDAT files. It is particularly useful for spike detection and preprocessing in neural signal analysis.

## Features

- Load primary signals from Allego XDAT files.
- Apply customizable bandpass filtering (default: 300–5000 Hz).
- Visualize raw or filtered signal from a selected channel.
- Export raw or filtered signals to CSV.
- Count spikes:
  - Choose between raw or filtered signal for spike detection.
  - Select spike polarity: positive or negative.
  - Define threshold and refractory period (default 1 ms @ 30 kHz = 30 samples).

## Requirements

- MATLAB (tested with R2020a and above)
- Allego XDAT files (must include `.xdat`, `.xdat.json`, and timestamp files)

## Usage

1. Place all Allego XDAT files in the current MATLAB folder.
2. Run the script in MATLAB.
3. Follow the prompts:
    - Enter the file name (without extension)
    - Select channel, time range, and filter settings
4. Choose one of the menu options:
    - Plot raw or filtered signal
    - Export data
    - Count spikes (with spike polarity and signal type options)
5. Exit to clear all variables

## Example

```
Enter the datasource name (e.g. allego_5__uid0416-17-09-09): my_data
Enter the channel number to analyze: 3
Enter the start time (in seconds): 0
Enter the end time (in seconds): 10
Enter bandpass range [low high] in Hz (press Enter to use default 300–5000 Hz)(e.g. [150 2000]):

Select a function to perform:
1. Plot Raw Signal
2. Plot Filtered Signal (300–5000 Hz)
3. Export Raw Signal to CSV
4. Export Filtered Signal to CSV
5. Count Spikes above/below Threshold
6. Exit
```

## Notes
- Filtered and raw signal CSVs include time and amplitude.
- Spike detection includes a refractory period to avoid overcounting.
- JSON metadata is required for signal channel structure and sampling rate.
