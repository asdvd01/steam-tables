function [ ] = regenerative(  )
c = input('Choose 1 for dry saturated steam and 2 for superheated steam entering turbine :');

switch c
    case 1
     ch1 = input('For Boiler Choose 1 For Pressure or 2 for Temperature Enter :');
    switch ch1
        case 1
            p1= input('Enter Boiler Pressure (in bar):');
            h1=XSteam('hV_p',p1);
            s1=XSteam('sV_p',p1);
        case 2
            T1 = input('Enter Boiler Temperature (in degree celcius):');
            h1=XSteam('hV_T',T1);
            s1=XSteam('sV_T',T1);
            p1 = Xsteam('psat_T',T1);
        otherwise
            disp('wrong choice');
   end   
   case 2
      p1 = input('Enter Boiler Pressure (in bar):');
      T1 = input('Enter Bolier Temperature (in degeree celcius):');
      s1 = XSteam('s_pT',p1,T1);
      h1 = XSteam('h_pT',p1,T1);
    otherwise
        disp('wrong choice');
end
disp('For Feed water heater Choose 1 For Pressure or 2 for Temperature');
ch2 = input('Enter :');

switch ch2
    case 1
      p2= input('Enter Feed water heater Pressure (in bar):');
      hV2=XSteam('hV_p',p2);
      hL2=XSteam('hL_p',p2);
      sV2=XSteam('sV_p',p2);
      sL2=XSteam('sL_p',p2);
      vL2=XSteam('vL_p',p2);
    case 2
      T2 = input('Enter Feed water heater Temperature (in degree celcius):');
      hV2=XSteam('hV_T',T2);
      hL2=XSteam('hL_T',T2);
      sV2=XSteam('sV_T',T2);
      sL2=XSteam('sL_T',T2);
      vL2=XSteam('vL_T',T2);
      p2 = Xsteam('psat_T',T2);
    otherwise
      disp('wrong choice\n');
end
disp('For Condensor Choose 1 For Pressure or 2 for Temperature');
ch3 = input('Enter :');

switch ch3
    case 1
      p3= input('Enter Condensor Pressure (in bar):');
      hV3=XSteam('hV_p',p3);
      hL3=XSteam('hL_p',p3);
      sV3=XSteam('sV_p',p3);
      sL3=XSteam('sL_p',p3);
      vL3=XSteam('vL_p',p3);
    case 2
      T3 = input('Enter Condensor Temperature (in degree celcius):');
      hV3=XSteam('hV_T',T3);
      hL3=XSteam('hL_T',T3);
      sV3=XSteam('sV_T',T3);
      sL3=XSteam('sL_T',T3);
      vL3=XSteam('vL_T',T3);
      p3 = Xsteam('psat_T',T3);
    otherwise
      disp('wrong choice\n');
end
s2 = s1;
x2 = (s2- sL2)/(sV2-sL2);
h2 = hL2+x2*(hV2-hL2);
s3 = s1;
x3 = (s3 - sL3) /(sV3-sL3);
h3 = hL3+x3*(hV3-hL3);
h4 = hL3;
h5 = h4 + 100*vL3*(p2-p3);
h6 = hL2;
h7 = h6 + 100*vL2*(p1-p2);
m = (h6 - h5)/(h2-h5);
wt1 = h1-h2;
wt2 = (1-m)*(h2-h3);
wp1 = (1-m)*(h5-h4);
wp2 = (h7-h6);
e = (wt1+wt2-wp1-wp2)*100/(h1-h7);
ssc = 3600/(wt1+wt2-wp1-wp2);
 fprintf('\nEfficiency = %0.2f ',e);
 fprintf('\nSpecific steam consumption = %0.4f kg per kwhr',ssc);
 fprintf('\nMass of steam = %0.4f kg \n',m);

end

