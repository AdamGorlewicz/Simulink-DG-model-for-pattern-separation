function [Rotp]= Routput(inputtrials, iterations, crossCor)
test1 = reshape(crossCor(inputtrials+1:inputtrials+iterations,inputtrials+1+iterations:end).',1,[]);
test2 = reshape(crossCor(inputtrials+1+(iterations*1):(inputtrials+(iterations*2)),inputtrials+1+(iterations*2):end).',1,[]);
test3 = reshape(crossCor(inputtrials+1+(iterations*2):(inputtrials+(iterations*3)),inputtrials+1+(iterations*3):end).',1,[]);
test4 = reshape(crossCor(inputtrials+1+(iterations*3):(inputtrials+(iterations*4)),inputtrials+1+(iterations*4):end).',1,[]);
test =[test1,test2,test3,test4];
Rotp = nanmean(test);