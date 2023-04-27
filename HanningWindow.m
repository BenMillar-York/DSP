N = 21;
n = 0:N;

hanning = 0.5 - 0.5 * cos(2*pi*n / N);
%hamming = 0.54 - 0.46 * cos(2*pi*n / N);
rectangle = ones(1,N+1);

%X = fft(hanning, 1024) / length(hanning);

NFFT = 1024;

%X = fftshift(fft (hanning, NFFT) / length (hanning));
X_Hamming = (fft (hanning, NFFT) / length (hanning));
X_Rect = (fft (rectangle, NFFT) / length (rectangle));

%Freq = (-NFFT/2: NFFT/2-1) / NFFT;
Freq = (0: NFFT / 2-1) / NFFT;     % Frequency vector

S_Hamming = X_Hamming (1: length (Freq)) / max (X_Hamming);
S_Rect = X_Rect (1: length (Freq)) / max (X_Rect);

mag_dB_Hamming =  20*log10(abs(S_Hamming));
mag_dB_Rect =  20*log10(abs(S_Rect));
%S = X (1: length (fk)) / max (X);

rectFig = figure('Name', 'Time and frequency response of a rectangular window', 'Position',[200 600 800 300]);
rectFig.Position(3:4) = [800,300];
axis equal
sgtitle('Time and frequency response of a rectangular window');
subplot(1,2,1)
plot(n, rectangle);
subplot(1,2,2)
plot(Freq, mag_dB_Rect);

%timePlot = figure;

hannFig = figure('Name', 'Time and frequency response of a hanning window', 'Position',[200 200 800 300]);
sgtitle('Time and frequency response of a hanning window');
subplot(1,2,1);
plot(n, hanning);
subplot(1,2,2)
plot(Freq, mag_dB_Hamming);

overlayFig = figure('Name', 'Frequency response of rectangle and hanning windows', 'Position',[1020 200 600 700]);
sgtitle('Frequency response of rectangle and hanning windows');
plot(Freq, mag_dB_Rect, '--');
hold on;
plot(Freq, mag_dB_Hamming);

