participant = '02';

recording = input('Enter Recording: ', 's');

soundDataArray = cell(1, 10);
sampleRateArray = zeros(1, 10);

for i = 1 : 10
    [soundData, sampleRate]  = loadRec(i-1, participant, str2double(recording));
    soundData = zeroPadding(soundData,max(sampleRate));
    soundDataArray{i} = soundData;
    sampleRateArray(i) = sampleRate;
end

plotRec4(soundDataArray,sampleRateArray);
%% 4.1

digito1 = input('digito 1: ', 's');
digito2 = input('digito 2: ', 's');


disp(digito1)
disp(digito2)
plotRec4_1(soundDataArray,sampleRateArray,str2double(digito1),str2double(digito2));
%%
participant = '02';
%%dados = getInfoForIF_ELSE(participant);

digito = input('Enter Digito: ', 's');
recording = input('Enter recording: ', 's');
[soundData, sampleRate] = loadRec(str2double(digito), participant, str2double(recording));

smoothedSignal = processar_sinal(soundData);
smoothedSignal = calculateEnvelope(smoothedSignal);
            
% Calculate Duration
duration = length(smoothedSignal) / 48000;

% Find Peaks and Valleys
[peaks, peakLocations] = findpeaks(smoothedSignal);

% Calculate Rate of Change
differences = diff(smoothedSignal);
timeDifferences = 1 / sampleRate; % Tempo entre amostras
averageRateOfChange = mean(differences ./ timeDifferences);
maxRateOfChange = max(differences ./ timeDifferences);
minRateOfChange = min(differences ./ timeDifferences);

% Calculate Energy
energy = sum(smoothedSignal.^2);

% Display the results
fprintf('Duration: %.2f seconds\n', duration);
fprintf('Number of Peaks: %d\n', length(peaks));
fprintf('Average Rate of Change: %.2f\n', averageRateOfChange);
fprintf('Maximum Rate of Change: %.2f\n', maxRateOfChange);
fprintf('Energy: %.2f\n', energy);

% Step 3: Digit Identification
%{
for i = 1:10 
    if maxRateOfChange <= dados(i).max_max_rate && maxRateOfChange >= dados(i).min_max_rate && energy >= dados(i).min_energy && energy <= dados(i).max_energy
        disp("found")
        digito_encontrado = i-1;
        disp(digito_encontrado)
    end
end
%}

digito = NaN;

if length(peaks) > 1000 && length(peaks) < 1500 && averageRateOfChange < -0 && averageRateOfChange > -0.2 && maxRateOfChange > 6900 && maxRateOfChange < 9000
    disp("found");
    digito = 0;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 1;
elseif length(peaks) > 500 && length(peaks) < 800 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 4000 && maxRateOfChange < 6000
    disp("found");
    digito = 2;
elseif length(peaks) > 200 && length(peaks) < 800 && averageRateOfChange < -0.005 && averageRateOfChange > -0.08 && maxRateOfChange > 2100 && maxRateOfChange < 5500
    disp("found");
    digito = 3;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 4;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 5;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 6;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 7;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 8;
elseif length(peaks) > 600 && length(peaks) < 1700 && averageRateOfChange < -0.06 && averageRateOfChange > -0.15 && maxRateOfChange > 7000 && maxRateOfChange < 8500
    disp("found");
    digito = 9;
end


% Step 4: Output
disp("digito");
disp(digito);

%% 
Ex5();