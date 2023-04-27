%% Window generation
% Generates the rectangular and hanning data windows
N = 21; % Number of taps
n = 0:N; % Iterate across taps

hanning = 0.5 - 0.5 * cos(2*pi*n / N);
rectangle = ones(1,N+1);

FFT_Length = 1024;

X_Rect = (fft (rectangle, FFT_Length) / length (rectangle));
X_Hanning = (fft (hanning, FFT_Length) / length (hanning));

%% Discrete Fourier Transform (DFT)
% Performs the DFT on the windows and scales them appropriately

% Fourier Freqencies
Freq=(0: FFT_Length / 2-1) / FFT_Length;

% Scale the results so they are relative to their max value
S_Hanning = X_Hanning (1: length (Freq)) / max (X_Hanning);
S_Rect = X_Rect (1: length (Freq)) / max (X_Rect);

% Covert to dB  
mag_dB_Hanning =  20*log10(abs(S_Hanning));
mag_dB_Rect =  20*log10(abs(S_Rect));

%% Plotting the figures

% Fig1: Rectangle window in time and frequency domains
rectFig = figure('Name', strcat("Time and frequency response of a rectangular window (N = ", string(N), ')'), 'Position',[200 600 800 300]);
rectFig.Position(3:4) = [800,300];
axis equal
sgtitle(strcat("Time and frequency response of a rectangular window (N = ", string(N), ')'));
subplot(1,2,1)
plot(n, rectangle);
xlabel('n'); 
ylabel('amplitude');
subplot(1,2,2)
plot(Freq, mag_dB_Rect);
xlabel('f');
ylabel('dB');

% Fig2: Hamming window in time and frequency domains
hammFig = figure('Name', strcat("Time and frequency response of a hanning window (N = ", string(N), ')'), 'Position',[200 200 800 300]);
sgtitle(strcat("Time and frequency response of a hanning window (N = ", string(N), ')'));
subplot(1,2,1);
plot(n, hanning, Color=[0.8500 0.3250 0.0980])
xlabel('n'); 
ylabel('amplitude');
subplot(1,2,2)
plot(Freq, mag_dB_Hanning, Color=[0.8500 0.3250 0.0980]);
xlabel('f');
ylabel('dB');

% Fig3: Rectangle and Hamming windows the in frequency domain
overlayFig = figure('Name', strcat("Frequency response of rectangular and hanning windows (N = ", string(N), ')'), 'Position',[1020 200 600 700]);
sgtitle(strcat("Frequency response of rectangular and hanning windows (N = ", string(N), ')'));
plot(Freq, mag_dB_Rect);
hold on;
plot(Freq, mag_dB_Hanning);
xlabel('f');
ylabel('dB');
legend('Rectangular','Hanning');