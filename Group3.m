while(1)
t = 0:0.1:150;
x = 0:0.1:150;
vel = menu('Select the case of your choice:','a. Phase velocity = group velocity','b. Phase velocity is greater than group velocity','c. Group velocity is greater than phase velocity','d. Non-zero phase velocity, zero group velocity','e. Zero phase velocity, non-zero group velocity','f. Phase velocity=-group velocity');
if (vel== 1)
    k1=-3.1;w1=9.3;k2=-2.9;w2=8.7;
end
if (vel==2)
    k1=-3.1;w1=24;k2=-2.9;w2=23;
end
if (vel==3)
    k1=-3.1;w1=13.65;k2=-2.9;w2=10.9;
end
if (vel==4)
    k1=-3.1;w1=18;k2=-2.9;w2=18;
end
if (vel==5)
    k1=-3.1;w1=1.0;k2=-2.9;w2=-1.0;
end
if (vel==6)
    k1=-3.1;w1=8.7;k2=-2.9;w2=9.3;
end
h=figure;
for k = 700:length(t)
   if ~ishandle(h);continue;end
    y1=cos(k1*x(1:k)+w1*t(k));
    y2=cos(k2*x(1:k)+w2*t(k));
    grid on
    l3=2*pi/abs((k1-k2)/2);
    n1=floor(w1*floor(l3)/(2*pi));
    l1=2*pi/abs(k1);
    f1=floor(floor(l3)/l1)*(l1);
    x1=w1*t(k)/abs(k1)-double(n1*l1)+f1;
    subplot(4,1,1)
    if(t(k)>=f1)
         if(x1>=f1)
             d=floor(x1/f1);
             s=floor(f1/l1);
             x1=x1-double(d*s*l1);
         end
         plot(x1,1,'r.','MarkerSize',20)
         hold on            
     end
     plot(x(1:k),y1,'color','r')
     title('f1(x) = cos(w1*t - k1*x)')
     axis([0 70 -1 1]);
     xlim([0 f1]);
     subplot(4,1,2)
     grid on
     l2=2*pi/abs(k2);
     n2=floor(w2*floor(l3)/(2*pi));
     f2=floor(floor(l3)/l2)*(l2);
     x2=w2*t(k)/abs(k2)-double(n2*l2)+f2;     
     if(t(k)>=f2)
         if(x2>=f2)
             d2=floor(x2/f2);
             s2=floor(f2/l2);
             x2=x2-double(d2*s2*l2);
         end
         plot(x2,1,'b.','MarkerSize',20)
         hold on
     end
     plot(x(1:k),y2,'color','b')
     title('f2(x) = cos(w2*t - k2*x)')
     axis([0 70 -1 1]);
     xlim([0 f2]);
     subplot(4,1,[3,4])
    xp=(w1+w2)*(t(k))/abs(k1+k2);
    
    if(t(k)>=l3)
        np=floor(xp/l3);
        xp=xp-double(np*l3);
        plot(xp,cos(k1*xp+w1*(t(k)))+cos(k2*xp+w2*t(k)),'r.','MarkerSize',20)
        hold on
    end
    xg=(w1-w2)*(t(k))/abs(k1-k2);
    if(t(k)>=l3)
        %% 
        ng=floor(xg/l3) ;
        xg=xg-double(ng*l3);
        plot(xg,2,'b.','MarkerSize',15)
        hold on
    end
    plot(x(1:k),cos(k1*t(1:k)+w1*t(k))+cos(k2*t(1:k)+w2*t(k)))
    axis([0 l3 -2 2]);
    title('f(x) = f1(x) + f2(x)')
    xlabel('red dot denotes phase velocity and blue dot denotes group velocity','FontWeight','bold')
    xlim([0 l3]);
    pause(0.05);
    
    if k~=length(t)
        clf
    end
   
end
choice = menu('Do you wish to view another case?','Yes','No');
if choice==2 || choice==0
   break;
end
end