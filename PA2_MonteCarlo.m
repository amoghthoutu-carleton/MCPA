set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultaxesfontsize', 20)
set(0, 'defaultaxesfontname','Times New Roman')
set(0, 'DefaultLineLineWidth', 2)

clear all
close all

nt=1000; % total time steps
 x=linspace(1,15*nt, nt);
 t=linspace(1,nt,nt);
 v= zeros(1,nt);
 av = zeros(1,nt); %average velocity


dt=1;
F =1;
m=1; 
a = F/m; % acceleration - (particle experiences constant acceleration until scattering)
re = 0; %percent of "forward" velocity after scattering
sp = 1-exp(-nt/(20*nt)); % scattering probability ;  P = 1 ? exp(??t/?) 
ts = 1; % time after scattering

for  i=2:nt
   
    if rand()< sp % if particle scattered
        ts = 0; 
        v(i) = re * v(i-1);
    else 
     ts =1;
     v(i) = v(i-1)+ a * ts; % update velocity
    end
    
    x(i) = x(i-1) + v(i-1) *ts + 1/2 * a * ts^2; % update position 
   
    
    av(i) = sum(v)/i;
    
    subplot(3,1,1)
    plot(t,v, '-')
    xlabel('time')
    ylabel('v')
    title(['Average: ',num2str(av(i))])
    hold on
    plot(t(1:i),av(1:i))
    hold off
   
    subplot(3,1,2)
    plot(x(1:i),v(1:i))
    xlabel('x')
    ylabel('v')

    subplot(3,1,3)
    plot(t(1:i),x(1:i))
    xlabel('time')
    ylabel('x')
    
    pause(0.01)

end




