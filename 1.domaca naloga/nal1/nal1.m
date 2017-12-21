format long
delilne = [10:10:100]*3 +2;

I = zeros(length(delilne),1);
for i=1:length(delilne)
    I(i) = integral(delilne(i),0);
end

h = 1./(delilne - 1);

xx = 0:0.001:h(1);
yy = spline(h,I,xx);
%plot(h,I,'o',xx,yy)

resitev = yy(1)
