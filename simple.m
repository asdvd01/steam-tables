function [  ] = simple( )
%simple Summary of this function goes here
%   Detailed explanation goes here
ch1 = input('For Boiler Choose 1 For Pressure or 2 for Temperature Enter :');

switch ch1
    case 1
      p1= input('Enter Boiler Pressure (in bar):');
      hV1=XSteam('hV_p',p1);
      %hL1=XSteam('hL_p',p1);
      sV1=XSteam('sV_p',p1);
     % sL1=XSteam('sL_p',p1);
    case 2
      T1 = input('Enter Boiler Temperature (in degree celcius):');
      hV1=XSteam('hV_T',T1);
     % hL1=XSteam('hL_T',T1);
      sV1=XSteam('sV_T',T1);
     % sL1=XSteam('sL_T',T1);
      p1 = Xsteam('psat_T',T1);
    otherwise
      disp('wrong choice');
end
disp('For Condensor Choose 1 For Pressure or 2 for Temperature');
ch2 = input('Enter :');

switch ch2
    case 1
      p2= input('Enter Condensor Pressure (in bar):');
      hV2=XSteam('hV_p',p2);
      hL2=XSteam('hL_p',p2);
      sV2=XSteam('sV_p',p2);
      sL2=XSteam('sL_p',p2);
      vL2=XSteam('vL_p',p2);
    case 2
      T2 = input('Enter Condensor Temperature (in degree celcius):');
      hV2=XSteam('hV_T',T2);
      hL2=XSteam('hL_T',T2);
      sV2=XSteam('sV_T',T2);
      sL2=XSteam('sL_T',T2);
      vL2=XSteam('vL_T',T2);
      p2 = Xsteam('psat_T',T2);
    otherwise
      disp('wrong choice\n');
end
 h1 = hV1;
 s1 = sV1;
 s2 = s1;
 x2 = (s2 - sL2)/(sV2-sL2);
 h2 = hL2 + x2*(hV2 - hL2);
 h3 = hL2;
 h4 = h3 + 100* vL2* (p1 - p2) ;
 e = ((h1-h2)-(h4-h3))/(h1-h4);
 e = e*100;
 ssc = 3600/((h1-h2)-(h4-h3));
 wr = ((h1-h2)-(h4-h3))/(h1-h2);
 
 fprintf('\nEfficiency = %0.2f ',e);
 fprintf('\nSpecific steam consumption = %0.4f Kg per Kwhr',ssc);
 fprintf('\nWork Ratio = %0.4f\n ',wr);
 
end

