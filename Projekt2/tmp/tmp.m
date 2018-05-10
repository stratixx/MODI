x=[2 4 6 8 10 12];
y=[2 4 4 5 5  7];

XY=x.*y;

Y = mean(y);
X = mean(x);

squareXsum = sum(x.*x);

N = length(x);

b = (sum(XY) - N*X*Y)/(squareXsum-N*X*X);

a = Y-b*X;

figure(1)
hold on; box on; grid on;
plot(x,y);
plot(0:1:20, (b*(0:1:20)+a))