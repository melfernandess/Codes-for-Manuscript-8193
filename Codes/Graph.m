close all

Perdas_k_60 = [4.72 4.7207 4.7212 4.7212 4.7212 4.7212 4.7212 4.7212 4.7212];
%% Sem restr
Perdas_k_normal = [4.7194	4.7205	4.7210	4.7212	4.7212	4.7212	4.7212	4.7212	4.7212]; 
k = [0 0.05 0.1 0.15 0.2 0.25 0.3 0.35	0.4];

%% Temperatura 
Horas = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];

%% Curva de Cargas
Carga = 100*[0.80333 0.76193 0.73937 0.72941 0.73154 0.75463 0.79454 0.82751 0.86546 0.8798 0.88844 0.8794 0.84894 0.86706 0.89295 0.91386 0.93797 0.9459 1 0.99609 0.96878 0.94577 0.90525 0.84376];

%% Comparação Profundidade de Descarga
%Plotar SOC dele versus k = 0
SOC_prof = (100/100)*[80    59    51    40    40    33    35    56    55    74    53    39    28    57    67    52    43    32    39    46    56    69    60  52    80];
SOC_norm = (100/100)*[80    59    62    55    66    68    69    66    61    56    57    60    43    49    54    52    55    54    52    49    54    66    50 70    80];
SOC_30 = (100/100)*[80    67    45    47    47    48    48    45    51    69    54    54    55    49    61    53    67    49    58    66    40  40    52    66    80];
Horas_SOC = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24];

%% Caso 2 e Caso 8
SOC_Caso8 = (100/100)*[80    58    62    56    65    69    69    67    61    56    56    60    43    48    53    52    55    53    52    49    54   67    50    70    80];
SOC_Caso2 = (100/100)*[ 80    51    43    41    63    62    68    64    62    50    49    44    43    59    65    70    77    77    69    56    50    44    55   68    80];

%% Temperatura
figure
plot (k, Perdas_k_60, 'r');
hold on
p2 = scatter(k, Perdas_k_60, 'r', 'filled');
hold on
plot (k, Perdas_k_normal, 'b');
hold on
p1 = scatter(k, Perdas_k_normal, 'b', 'filled');
xlabel('\fontsize{12} Parâmetro de Sensibilidade - k (Adimensional)')
ylabel('\fontsize{12} Perdas (MWh)')
legend([p1 p2], 'Perdas - Restrição Inativa', 'Perdas - ΔSOC≤60%')

%% Comparação Considerando Profundidade de Descarga
figure
bar(Horas, Carga, 'FaceColor', [0.6 0.8 1]);
hold on
plot (Horas_SOC, SOC_norm, 'y');
hold on
p3 = scatter(Horas_SOC, SOC_norm, 'y', 'filled');
hold on
plot (Horas_SOC, SOC_prof, 'b');
hold on
p2 = scatter(Horas_SOC, SOC_prof, 'b', 'filled');
hold on
plot (Horas_SOC, SOC_30, 'r');
hold on
p1 = scatter(Horas_SOC, SOC_30, 'r', 'filled');
xlabel('\fontsize{12} Tempo (Horas)')
ylabel('\fontsize{12} SOC e Carga (%)')
ylim([0, 140])
legend([p3 p1 p2], 'Restrição ΔSOC≤30% Ativa','Restrição ΔSOC≤60% Ativa', 'Restrição Inativa')


%% Caso 2 e Caso 8
figure
bar(Horas, Carga, 'FaceColor', [0.6 0.8 1]);
hold on
plot (Horas_SOC, SOC_Caso2, 'b');
hold on
p1 = scatter(Horas_SOC, SOC_Caso2, 'b', 'filled');
hold on
plot (Horas_SOC, SOC_Caso8, 'r');
hold on
p2 = scatter(Horas_SOC, SOC_Caso8, 'r', 'filled');
legend([p1 p2], 'SOC - Caso 2', 'SOC - Caso 8')
xlabel('\fontsize{12} Tempo (Horas)')
ylabel('\fontsize{12} SOC e Carga (%)')
ylim([0, 140])



