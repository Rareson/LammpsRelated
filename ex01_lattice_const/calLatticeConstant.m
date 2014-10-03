function calLatticeConstant(N,step,inFileName)
% calcuate the lattice constant according to "lat_const cohesive_energy"
% Input:
%   N: order of the polynomial fitting.
%   step: the fitting interval, if too small, the figure will be odd while the
%         numeric result may be correct.
%   inFileName: name of the file storing "lat_const cohesive_energy"

% Example:
%   calLatticeConstant(3,0.01,'lattice_02_processed.data')
%   Here, 'lattice_02_processed.data' is a file stores "lat_const cohesive_energy"
% The result is:
% lat_const = 3.5659
% coh_energy = -7.3682
% A snapshot of the figure is named lattice_2_processed.jpg.
% Originally Created by Xianbao Duan
% Email: xianbao.d@gmail.com
% Source: http://www.52souji.net/matlab-calculate-lattice-constant/

% Improved by Domicor (g1114128525@gmail.com) in Nov. 1, 2014.
 
% read in data from the file
data = load(inFileName,'-ascii');
x = data(:,1);
y = data(:,2);
 
Ecoh = polyfit(x,y,N);      % polynomial fitting
dEcoh = polyder(Ecoh);      % derivation of the polynomial equation
zero_points = roots(dEcoh);     % solve the zero points
 
% calculate the lattice constant and coresponding cohesive energy
for i = 1: length(zero_points)
    if isreal(zero_points(i))
        if zero_points(i) > x(1)
            if zero_points(i) < x(end)
                lat_const = zero_points(i)
                coh_energy = spline(x,y,lat_const)
            end
        end
    end
end
 
% plot the curve
xx = x(1):step:x(end);
yy = polyval(Ecoh,xx);
figure;
plot(x,y,'o',xx,yy);
xlabel('lattice constant / A');
ylabel('cohesive energy / eV');
legend('Original points','Fitted curve');
