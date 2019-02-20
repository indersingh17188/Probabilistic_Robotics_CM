function [O,P] = weather (M,N, cond)
%This function will generate the sequence of weather forecast for upcoming
%N no of days given the weather condition of day 1 and the probability
%matrix M
O = [];
c_Sunny = 0;
c_Cloudy = 0;
c_Rainy = 0;
for i=2:N
D_new = M*cond;
x = rand(1);
if x < D_new(1)
    day = 'Sunny ';
    c_Sunny = c_Sunny+1;
    cond = [1 0 0]'; %Changing previous day's probability matrix
elseif x <D_new(1)+D_new(2)
    day = 'Cloudy ';
    c_Cloudy = c_Cloudy+1;
    cond = [0 1 0]';
else
    day = 'Rainy ';
    c_Rainy = c_Rainy+1;
    cond = [0 0 1]';
end
O = [O day];
P = [c_Sunny c_Cloudy c_Rainy]';
P = P/N;
end

    
    



