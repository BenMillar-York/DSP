N = 21;
n = 0:N;

hanning = 0.5 - 0.5 * cos(2*pi*n / N);
rectangle = ones(1,N+1);

plot(n, hanning);
hold on;
plot(n, rectangle);
figure;

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
plot(Freq, mag_dB_Hamming);
hold on;
plot(Freq, mag_dB_Rect);
