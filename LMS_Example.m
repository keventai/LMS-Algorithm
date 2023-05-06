clc
clear all;
close all;

t=0.001:0.001:1;
%The above line generates an array with first element as 0 and last element as 0.1, where each sucessive elements have a common difference of 0.0001. It is a Arithmetic preogression.
d=2*sin(2*pi*50*t);
%Plotting a sine wave
figure;M=200; %create figure window
plot(d); %This MATLAB function plots 2-D line graph; values Y vs the corresponding values in X
N=numel(d); %array of d(sine wave); returns the number of elements in array N
x=d(1:N)+.9*randn(1,N); 
%uniformly distributes noise
w=zeros(1,M);
wi=zeros(1,M);
% algorithm starts with small weights; assume zero weights in most cases

e=[]; %to create an array and stores the number get from each iterations
mu=0.0005;
% u(mu/step size) is taken small to ensure that the algorithm converges

for i=M:N %for loop (i) to repeat specific number of times
e(i)=d(i)-wi*x(i:-1:i-M+1)'; %variables can change size at each iterations of loop
wi = wi+2*mu*e(i)*x(i:-1:i-M+1);
end %This MATLAB function terminates for loop statement
y = zeros(N,1); %create an array of zeros from N all the way to 1
%implementation of LMS algorithm/Estimated/Outputted signals
for i=M:N
  j=x(i:-1:i-M+1);
  y(i)=((wi)*(j)'); %output signals transpose array
end
errorsignals = ctranspose(y)-d;
subplot(4,1,1),plot(d);ylim([-4 4]);title('Desired/inputted signal');
subplot(4,1,2),plot(x,'Color','r');title('Noisy Signals');
subplot(4,1,3),plot(y);title('Estimated/Outputted signals');
subplot(4,1,4),plot(errorsignals,'Color','r');ylim([-4 4]);title('Remaining Error signals');
