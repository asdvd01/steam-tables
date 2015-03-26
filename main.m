clear;

cycles={'Simple Rankine Cycle','Superheated Rankine Cycle','Reheated Rankine Cycle','Regenerative Rankine Cycle'};
for i=1:4
str=char(cycles(i));
fprintf('Choose %d for %s\n',i,str);
end;
c = input('Enter :');

switch c
    case 1
        simple();
    case 2
        superheated();
    case 3
        reheated();
    case 4
        regenerative();
    otherwise
        disp('Wrong Choice');
end
