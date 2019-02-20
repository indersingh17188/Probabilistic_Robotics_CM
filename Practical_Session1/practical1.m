%A simulater that can randaomly generate sequences of weather from a
%transition matrxi M (Markov Matrix)

M = [.8 .2 0;.4 .4 .2;.2 .6 .2]';
day1 = [0 1 0]';
[forecast,prob] = weather(M,100000,day1);
disp(forecast);
disp(prob);

%Computing eigen vectors & values for Markov matrix
[V,D]=eig(M);

%Eigen vector equivalent to eigen value 1 will give the equilibrium state
%i.e stationary distribution in our case
sum=V(1)+V(2)+V(3); %factor to normalize the eigen vectors
new_prob=[V(1)/sum V(2)/sum V(3)/sum]'; %normalizing eigen vectors
disp(new_prob);

%Find entropy
H = 0;
for i=1:3
    H=H-(new_prob(i)*log(new_prob(i)));
end
disp(H);
%Another way to find entrophy
H_1 = -sum(new_prob .* log(new_prob));
disp(H_1);
    
    