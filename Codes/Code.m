%% Este código tem o objetivo de demonstrar o cálculo do fluxo de potência utilizado no artigo

[DSSStartOK, DSSObj, DSSText] = DSSStartup;

if DSSStartOK
     DSSText.Command = 'compile "C:\Users\lucas\OneDrive\Desktop\Doutorado 2023\04 Abril\Artigo\Run_IEEE34Mod2.dss"';
%% Configuração interface
    
    DSSCircuit=DSSObj.ActiveCircuit;
    DSSSolution=DSSCircuit.Solution;
    DSSText.Command ='Set overloadreport=true'; 
    DSSText.Command ='Set voltexcept=true';      
    DSSText.Command ='set demand=true';          
    DSSText.Command ='set DIVerbose=true'; 
    
%% Curva ONS   
    DSSText.Command='New LoadShape.Curva npts=24 interval=1 mult=(0.80333 0.76193 0.73937 0.72941 0.73154 0.75463 0.79454 0.82751 0.86546 0.8798 0.88844 0.8794 0.84894 0.86706 0.89295 0.91386 0.93797 0.9459 1 0.99609 0.96878 0.94577 0.90525 0.84376)';
 
 %% Editando Cargas  
    DSSText.Command = 'BatchEdit Load..* status=variable daily=Curva';

barra_1f = 888; node = 2; voltage_1f = 2.4018; n_bat_1f = 1;

matriz_pot_op_1f = [-39     7   -10    16     7     0    -3   -10    -9     0     8   -32    10    10    -2     6    -4    -2    -6    10    25   -31    37  18];

%% Resolvendo flow
load_1f_flow = []; aux_calc1 = []; 
cont_car = 0; 
matriz_q = zeros(3,24); 

Perdas = []; Tensao = [];

for i=0:horas-1 
    
load_1f_flow = matriz_pot_op_1f(1,1+i);
 
 
 if n_bat_1f ~=0
    for k=1:n_bat_1f 
        if i == 0 
            DSSText.Command=sprintf('New Load.Carga1f.%d Bus1=%d.%d Phases=1 Model=1  kW=%f pf=1 kv=%f vminpu =0.8 vmaxpu =1.99', k, barra_1f(k), node(k), load_1f_flow(k), voltage_1f(k));
        end
        
        if i>0 
           DSSText.Command=sprintf('Edit Load.Carga1f.%d Bus1=%d.%d Phases=1 Model=1  kW=%f pf=1 kv=%f vminpu =0.8  vmaxpu =1.99', k, barra_1f(k), node(k), load_1f_flow(k), voltage_1f(k));
       end
    end
 end

 %% Levantamento de Dados
    DSSText.Command = sprintf('Solve mode=daily hour=%d number=1',i);
    Perdas = [Perdas DSSCircuit.Losses(1)]; %em Watt
    load_1f_flow = [];
    aux_1 = [];
end

perdas_tot = ((sum(Perdas))/1000); %em KWh

fprintf('Perdas de energia elétrica totais %.2f kWh\n', perdas_tot);

end
