function [ ] = reheated(  )
 p1 = input('Enter Boiler (Turbine 1) Pressure (in bar):');
 T1 = input('Enter Bolier (Turbine 1) Temperature (in degeree celcius):');
 s1 = XSteam('s_pT',p1,T1);
 h1 = XSteam('h_pT',p1,T1);
 disp('For Turbine 2 inlet Choose 1 For Pressure or 2 for Temperature');
 ch2 = input('Enter :');

switch ch2
    case 1
      p2= input('Enter Turbine 2 inlet Pressure (in bar):');
      hV2=XSteam('hV_p',p2);
      hL2=XSteam('hL_p',p2);
      sV2=XSteam('sV_p',p2);
      sL2=XSteam('sL_p',p2);
      vL2=XSteam('vL_p',p2);
    case 2
      T2 = input('Enter Turbine 2 inlet Temperature (in degree celcius):');
      hV2=XSteam('hV_T',T2);
      hL2=XSteam('hL_T',T2);
      sV2=XSteam('sV_T',T2);
      sL2=XSteam('sL_T',T2);
      vL2=XSteam('vL_T',T2);
      p2 = Xsteam('psat_T',T2);
    otherwise
      disp('wrong choice\n');
end
 p3 = input('Enter Turbine 2 outlet Pressure (in bar):');
 T3 = input('Enter Turbine 2 outlet Temperature (in degeree celcius):');
 s3 = XSteam('s_pT',p3,T3);
 h3 = XSteam('h_pT',p3,T3);
disp('For Condensor Choose 1 For Pressure or 2 for Temperature');
ch4 = input('Enter :');

switch ch4
    case 1
      p4= input('Enter Condensor Pressure (in bar):');
      hV4=XSteam('hV_p',p4);
      hL4=XSteam('hL_p',p4);
      sV4=XSteam('sV_p',p4);
      sL4=XSteam('sL_p',p4);
      vL4=XSteam('vL_p',p4);
    case 2
      T4 = input('Enter Condensor Temperature (in degree celcius):');
      hV4=XSteam('hV_T',T4);
      hL4=XSteam('hL_T',T4);
      sV4=XSteam('sV_T',T4);
      sL4=XSteam('sL_T',T4);
      vL4=XSteam('vL_T',T4);
      p4 = Xsteam('psat_T',T4);
    otherwise
      disp('wrong choice\n');
end
s2 = s1;
x2 = (s2-sL2)/(sV2-sL2);
h2 = hL2 + x2*(hV2- hL2);
s4 = s3;
x4 = (s4 - sL4)/(sV4-sL4);
h4 = hL4 + x4 * (hV4 - hL4);
h5 = hL4 ;
h6 = h5 + 100 * vL4 * (p1-p4);
wt1 = (h1-h2);
wt2 =  (h3-h4);
wt = wt1 + wt2;
wp = (h6-h5);
qreheat = h3-h2;
qin = (h1-h6)+(h3-h2);
ssc = 3600/(((h1-h2)+(h3-h4))-(h6-h5));
e = ((wt-wp)/qin)*100;
 fprintf('\nEfficiency = %0.2f ',e);
 fprintf('\nAmount of reheat required = %0.4f KJ/kg',qreheat);
 fprintf('\nWork Done by High Pressure Turbine = %0.4f KJ/kg',wt1);
 fprintf('\nWork Done by Low Pressure Turbine = %0.4f KJ/kg',wt2);
 fprintf('\nWork Done on Pump = %0.4f KJ/kg',wp);
 fprintf('\nSpecific steam consumption = %0.4f kg per kwhr\n',ssc);

end

