% general simulation settings----------------------------------------------
nrofgranulecells = 20;
nrofinterneurons = 2;
stepsize = 1; % simulation step size
simulationtime = 2000; %[ms]
noumberofevents = 500; % number of synaptic events
inputtrials = 5;
iterations = 10;
no_inputsets = 5;
% granule cells settings---------------------------------------------------
%vr1 = -75; % [mV]
vr1 = -60; % [mV]
ve1 = -5; % [mV]
vt1 = -55; % [mV]
k1 = 0.25; % [1/nSmV]
a1 = 0.02; % [1/ms]
b1 = 0.025; % [nS]
c1 = -65; % [mV]
d1 = 6; % [pA]
C1 = normrnd(100,10,[1,nrofgranulecells]); % [pF]
%C1 = normrnd(65,10,[1,nrofgranulecells]); % [pF]
minimum_saturation_limit_1 = -80; % minimum possible membrane potential
% interneurons settings----------------------------------------------------
vr2 = -65; % [mV]
ve2 = -80; % [mV]
vt2 = -48; % [mV]
k2 = 0.25; % [1/nSmV]
a2 = 0.02; % [1/ms]
b2 = 0.04; % [nS]
c2 = -65; % [mV]
d2 = 2; % [pA]
C2 = normrnd(100,10,[1,nrofinterneurons]); % [pF]
minimum_saturation_limit_2 = -100; % minimum possible membrane potential
% extracellural space settings---------------------------------------------
Re = 230; %[cm]
for i = 1:(nrofgranulecells+nrofinterneurons)
Nd(i) = normrnd(10,5); %[um]
end
% stimmulation pattern -generation and plotting
inputsets{1} = load('inputsets.mat','inputset_020').inputset_020;
inputsets{2} = load('inputsets.mat','inputset_040').inputset_040;
inputsets{3} = load('inputsets.mat','inputset_060').inputset_060;
inputsets{4} = load('inputsets.mat','inputset_080').inputset_080;
inputsets{5} = load('inputsets.mat','inputset_100').inputset_100;
for no_input =1:no_inputsets
inputset = inputsets{no_input};
[crossCor, Rinput] = plot_inputset(inputset);
input_correlation_coefficients{no_input}=Rinput;
for repeat = 1:iterations
% granule cells EPSCs settings---------------------------------------------
for i=1:nrofgranulecells
decaytimes1(i,:) = normrnd(5,0.5,[1,noumberofevents]); % tau [ms]
conductancemaxima1(i,:) = normrnd(15,1.5,[1,noumberofevents]); %[pA]
end
% granule cells IPSCs settings----------------------------------------
for i=1:nrofgranulecells
decaytimes2(i,:) = normrnd(10,1,[1,noumberofevents]); %[ms]
conductancemaxima2(i,:) = normrnd(25,2.5,[1,noumberofevents]); %[pA]
end
% interneurons EPSCs settings----------------------------------------------
for i=1:nrofinterneurons
decaytimes3(i,:) = normrnd(6,0.6,[1,noumberofevents]); %[ms]
conductancemaxima3(i,:) = normrnd(25,2.5,[1,noumberofevents]); %[]
end
%run simulation------------------------------------------------------------
for trace = 1:inputtrials
out(trace) = sim("pattern_separation"); 
end
simulation_result{no_input,repeat}=out;
progress = ['inputset ' num2str(no_input)  ' of 5 ' num2str(repeat/10*100) '%']
end
end
progress = 'creating datasets'

[output_datasets,output_correlation_matrices, output_correlation_coefficients] = create_datasets(simulation_result, inputsets, inputtrials, iterations, no_inputsets);
progress = 'simulation completed'
clear a1 a2 ans b1 b2 c1 C1 c2 C2 conductancemaxima1 conductancemaxima2 conductancemaxima3 croscormatrix d1 d2 decaytimes1 decaytimes2 decaytimes3 i k1 k2 noumberofevents nrofinterneurons out repeat rinput simulationtime stepsize trace ve1 ve2 vr1 vr2 vt1 vt2
clear inputtrials iterations nrofgranulecells output_coefficients no_input inputset crossCor Rinput progress minimum_saturation_limit_1 minimum_saturation_limit_2 no_inputsets Nd Re
