function [codeout] = getCodeout(handles)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global outputheaders
global f
global D
global n
global N
global p
global e
global s
global S
global l
global L
global w
global W 
global a
global A
global m
global M
global k
global b
global P
global c
global d
global x
global y 
global u
global v
global o
global r
global t

global f1
global D1
global n1
global N1
global p1
global e1
global s1
global S1
global l1
global L1
global w1
global W1
global a1
global A1
global m1
global M1
global k1
global b1
global P1
global c1
global d1
global x1
global y1 
global u1
global v1
global o1
global r1
global t1
foldername = get(handles.SelectData, 'UserData');
specific = get(handles.SpecificTime, 'Value');
spdwin = '';
fwdbiasdist = '';

mindistance =[' -M ', num2str(get(handles.MinDistance, 'String'))];
mintime = [' -t ', num2str(get(handles.MinTime, 'String'))];
dataspace = [' -T ', num2str(get(handles.DataSpacing, 'String'))];
speedwind = [' -s ', num2str(get(handles.SpeedWindow, 'String'))];
fwddist = [' --minimum-biased ' num2str(get(handles.FwdBiasDistance, 'String'))];

%% Calibration and autoscaling
useautoscale = get(handles.AutoScale, 'Value');

if useautoscale == 1
    
    urname = regexp(foldername, '\', 'split');
    urpath = strrep(foldername, urname{end}, '');
    
        prescale = AutoScale(urpath);
        set(handles.scale, 'String', prescale)
        
elseif useautoscale == 0
prescale = get(handles.scale, 'String');
end


scaled = num2str(1/str2num(prescale));
rescaled = [' -p ' scaled];
%%


from = num2str(get(handles.FromTime, 'String'));
to = num2str(get(handles.ToTime, 'String'));
spec = '';
if specific == 1 
    spec = [' --from ' from ' --to ' to];
elseif specific == 0
    spec ='';
end
%% pulldown menus

velchoice = get(handles.VelocityUnits, 'Value');
dispchoice = get(handles.DisplayType, 'Value');
lengthunits = '';
disptype = '';

if velchoice == 1
    lengthunits = ' --body-length-units';
elseif velchoice == 0
    lengthunits = '';
end


if dispchoice == 1
    disptype = ' --map ';
elseif dispchoice == 2
    disptype = ' -I ';
end

%% outputs
frame = get(handles.Frame, 'Value');
    if frame == 1 
       f = 'frame,';
       f1 = 'frame ';
    elseif frame == 0
       f = '';
      
    end
ID = get(handles.ID, 'Value');
    if ID == 1
        D = 'id,';
        D1 = 'ID ';
    elseif ID == 0
        D = '';
       
    end
objects = get(handles.Objects, 'Value');
    if objects == 1 
        n = 'number,';
        n1 = 'Number ';
    elseif objects == 0
        n = '';
     
    end
goodobjects = get(handles.GoodObjects, 'Value');
    if goodobjects == 1
        N = 'goodnumber,';
        N1 = 'Good Number ';
    elseif goodobjects == 0
        N = '';
   
    end
persistance = get(handles.Persistance, 'Value');
    if persistance == 1
        p = 'persistence,';
        p1 = 'Persistence ';
    elseif persistance == 0
        p = '';
    
    end
area = get(handles.Area, 'Value');
    if area == 1
        e = 'area,';
        e1 = 'Area ';
    elseif area == 0
        e = '';
    
    end    
speed = get(handles.Speed, 'Value');
    if speed == 1
        s = 'speed,';
        s1 = 'Speed ';
    elseif speed == 0
        s = '';
       
    end
angspeed = get(handles.AngularSpeed, 'Value');
    if angspeed == 1
        S = 'angular,';
        S1 = 'Angular Velocity ';
    elseif angspeed == 0 
        S = '';
    
    end
length = get(handles.Length, 'Value');
    if length == 1
        l = 'length,';
        l1 = 'Length ';
    elseif length == 0
        l = '';
      
    end
    
rellength = get(handles.RelativeLength, 'Value');
    if rellength == 1
        L = 'rellength,';
        L1 = 'Relative Length ';
    elseif rellength == 0 
        L = '';
      
    end
width = get(handles.Width, 'Value');
    if width == 1
        w = 'width,';
        w1 = 'Width ';
    elseif width == 0
        w = '';
   
    end
relwidth = get(handles.RelativeWidth, 'Value');
    if relwidth == 1
        W = 'relwidth,';
        W1 = 'Relative Width ';
    elseif relwidth == 0
        W = '';
       
    end
aspect = get(handles.Aspect, 'Value');
    if aspect == 1
        a = 'aspect,';
        a1 = 'Aspect ';
    elseif aspect == 0 
        a = '';
      
    end
relaspect = get(handles.RelativeAspect, 'Value');
    if relaspect == 1
        A = 'relaspect,';
        A1 = 'Relative Aspect ';
    elseif relaspect == 0 
        A = '';
     
    end
midlength = get(handles.MidlineLength, 'Value');
    if midlength == 1
        m = 'midline,';
        m1 = 'Midline Length ';
    elseif midlength == 0
        m = '';
     
    end
midwidth = get(handles.MidlineWidth, 'Value');
    if midwidth == 1 
        M = 'morphwidth,';
        M1 = 'Midline Width ';
    elseif midwidth == 0 
        M = '';
  
    end
kink = get(handles.Kink, 'Value');
    if kink == 1 
        k = 'kink,';
        k1 = 'Kink ';
    elseif kink == 0 
        k = '';
      
    end
bias = get(handles.Bias, 'Value');
    if bias == 1
        b = 'bias,';
        b1 = 'Bias ';
    elseif bias == 0
        b = '';
    
    end
pathlength = get(handles.PathLength, 'Value');
    if pathlength == 1 
        P = 'pathlen,';
        P1 = 'Pathlength ';
    elseif pathlength == 0
        P = '';
    
    end
curve = get(handles.Curvature, 'Value');
    if curve == 1
        c = 'curve,';
        c1 = 'Curvature ';
    elseif curve == 0 
        c = '';
       
    end
direction = get(handles.DirectionalConstancy, 'Value');
    if direction == 1
        d = 'dir,';
        d1 = 'Dir ';
    elseif direction == 0
        d = '';
      
    end
lox = get(handles.LocX, 'Value');
    if lox == 1 
        x = 'loc_x,';
        x1 = 'X location ';
    elseif lox == 0
        x = '';
      
    end
loy = get(handles.LocY, 'Value');
    if loy == 1 
        y = 'loc_y,';
        y1 = 'Y Location ';
    elseif loy == 0
        y = '';
       
    end
vex = get(handles.VelX, 'Value');
    if vex == 1 
        u = 'vel_x,';
        u1 = 'X Velocity ';
    elseif vex == 0
        u = '';
     
    end
vey = get(handles.VelY, 'Value');
    if vey == 1 
        v = 'vel_y,';
        v1 = 'Y Velocity ';
    elseif vey == 0
        v = '';
 
    end
orientation = get(handles.Orientation, 'Value');
    if orientation == 1
        o = 'orient,';
        o1 = 'Orientation ';
    elseif orientation == 0
        o = '';

    end
crab = get(handles.Crab, 'Value');
    if crab == 1
        r = 'crab,';
        r1 = 'Crab ';
    elseif crab == 0
        r = '';
  
    end
tap = get(handles.Tap, 'Value');
    if tap == 1
      t = 'tap,';
      t1 = 'Tap ';
    elseif tap == 0
        t = '';
    
    end
    amp1 = '';
amplitude = get(handles.Amplitude, 'Value');
    if amplitude == 1
        amp = 'amp,';
        amp1 = 'Amplitude';
        ampplug = ' --plugin amp@Amplitude';
    elseif amplitude == 0
        amp ='';
        amp1='';
        ampplug = '';
    end
    
custom = get(handles.Custom, 'String');
cmp = strcmp(custom, '0');
customout = '';
    if cmp == 0 
        customout = custom; 
    elseif cmp == 1
        customout = '';
    end
    
%custom times


customtimes = get(handles.CustomTimes, 'Value');
duration = num2str(get(handles.Duration, 'String'));
times = num2str(get(handles.Times, 'String'));
trigchoice = get(get(handles.TrigChoice, 'SelectedObject'), 'String');
useprepost = get(handles.UsePrePost, 'Value');
pre = num2str(get(handles.Pre, 'String'));
post = num2str(get(handles.Post, 'String'));
cust = '';
trigtest = strcmp(trigchoice, 'Time');

if customtimes == 1 && trigtest == 1 
    cust = [' --trigger ' duration ',' times];
end

if customtimes == 1 && trigtest == 0 && useprepost == 0
    cust = [' --trigger ' duration ',tap:: '];
end

if customtimes == 1 && trigtest == 0 && useprepost == 1
    cust = [' --trigger ' duration ',tap:' pre ':' post ' '];
end






%plugins
shad = '';
resp = '';
reout = '';
spinesfwd = '';
respined = get(handles.Respine, 'Value');
    if respined == 1
        resp = ' --plugin Respine';
    end
reoutlined = get(handles.Reoutline, 'Value');
    if reoutlined == 1
       reout = ' --plugin Reoutline::exp::despike';
    end
shadowless = get(handles.Shadowless, 'Value');
    if shadowless == 1
        shad = ' --shadowless';
    end
    
 spinesforward = get(handles.SpinesForward, 'Value');
    if spinesforward == 1
        spinesfwd = ' --plugin SpinesForward';
    end
    
%Measure Reversals
 measurerev = '';

 usemeasurerev = get(handles.MeasureReversal, 'Value');
 dt = num2str(get(handles.DT, 'String'));
 idt = num2str(get(handles.IDT, 'String'));
 revtrigger = get(handles.RevTrigger, 'Value');
 collect = get(handles.Collect, 'Value');
 bin = num2str(get(handles.BinSize, 'String'));
 event = get(handles.Event, 'String');
 hi = num2str(get(handles.Hi, 'String'));
 low = num2str(get(handles.Low, 'String'));
 histogram = '';
 trigger ='';
 scale= str2double(get(handles.scale, 'String'));
 hibutton = get(handles.HiButton, 'Value');
 lowbutton = get(handles.LowButton, 'Value');
 smallnum = str2double(get(handles.TooSmall, 'String'));
 toolittle = ((smallnum)/(1/scale));
 toosmall = num2str(toolittle);
 toobrief = get(handles.TooBrief, 'String');
 if hibutton == 1 
     hilow = ['+' hi];

 elseif lowbutton == 1
     hilow = ['-' low];
     
 end
 
 
 if revtrigger == 1
     trigger = 'all';
 elseif revtrigger == 2
     trigger = 'tap';
 elseif trigger == 3
     trigger = [event hilow];
 end
 
 if usemeasurerev == 1
     measurerev = [' --plugin MeasureReversal::' trigger '::dt=' dt '::idt=' idt '::toobrief=' toobrief '::toosmall=' toosmall '::postfix=txt']; 
 end
 if usemeasurerev == 1 && collect == 1
     histogram = ['::collect=' bin];
 else 
     histogram ='';
 end
 revoutput = [measurerev histogram];
 
 %extract 
 
 useextract = get(handles.UseExtract, 'Value');
 extspine = get(handles.Spine, 'Value');
 extoutline = get(handles.Outline, 'Value');
 extract = '';
 if useextract == 1 && extspine == 1
     extract = ' --plugin Extract::spine';
 end
 
     if useextract == 1 && extoutline == 1
     extract = ' --plugin Extract::outline';
     end
 
 
% Curvaceous
    usecurvaceous = get(handles.UseCurvaceous, 'Value');
    curvaceousscale = get(handles.CurvaceousScale, 'String');
    interrupt = get(handles.Interrupt, 'String');
    curvaceousout = '';
   
    if str2double(curvaceousscale) ~= 0 
        curvaceousscale = ['::' curvaceousscale];
    elseif str2double(curvaceousscale) == 0 
        curvaceousscale = '';
    end
    
    if str2double(interrupt) ~= 0 
        interrupt = ['::' interrupt];
    elseif str2double(interrupt) == 0 
        interrupt = '';
    end
    
    if usecurvaceous == 1
        curvaceousout = [' --plugin cv@Curvaceous' curvaceousscale interrupt];
    end
    
    
% EigenSpine
    eigenchoice='';
    eigengraphic ='';
    eigendata = '';
    passdata = '';
    extraname = get(handles.SelectExtraData, 'UserData');
    eignout = '';
    
    useeigen = get(handles.UseEigenspine, 'Value');
        if useeigen == 1
            eigenchoice = ' --plugin Eigenspine';
        elseif useeigen == 0
            eigenchoice ='';
        end
        
    
    numpcs = get(handles.NumPCS, 'String');
        if useeigen == 1 
            pcs = ['::' numpcs];
        end
        
    generategraphic = get(handles.GenerateGraphic, 'Value')  ;
        if generategraphic == 1
            eigengraphic ='::graphic';
        end
        
     extradata = get(handles.ExtraData, 'Value');
         if extradata == 1
             eigendata ='::data';
         elseif extradata == 0 
             eigendata = '';
         end
         
         
     datause = get(handles.DataUse, 'Value');
        if datause == 1
            passdata ='';
        end
        
        if datause == 2
            passdata = ['::vector=' extraname];
        end
        
        if datause == 3
            passdata = ['::extra=' extraname];
            
        end
        
        
       if useeigen == 1
           eigenout = [eigenchoice pcs eigengraphic eigendata passdata];
       elseif useeigen == 0
           eigenout = '';
       end
       
       
% Measure Omegas
    omegaout = '';
    measureomegas = get(handles.MeasureOmegas, 'Value');
        if measureomegas == 1
            omegaout = ' --plugin MeasureOmega';
        elseif measureomegas == 0 
            omegaout = '';
        end
        
usemultisense = get(handles.UseMultiSense, 'Value');
senseall = get(handles.SenseAll, 'Value');
senseomegas = get(handles.SenseOmegas, 'Value');
sensereversals = get(handles.SenseReversals, 'Value');
senseout = '';
senseo = '';
senser = '';

if senseomegas == 1
    senseo = 'o';
elseif senseomegas == 0
    senseo = '';
end

if sensereversals == 1
    senser = 'b';
elseif sensereversals == 0
    senser = '';
end


if usemultisense == 1 && senseall == 1
    senseout = ' --plugin MultiSensed::report';
else 
    senseout ='';
end

if usemultisense == 1 && (senseomegas == 1 || sensereversals == 1)
    senseout = [' --plugin MultiSensed::report=' senseo senser ' '];
end
        
        
  
    
%individual outputs
individual = get(handles.IndividualOutputs, 'String');
test = strcmp(individual, '0');
individualoutputs = '';
    if test == 0 
        individualoutputs = [' -N' individual]; 
    elseif test == 1
        individualoutputs = '';
    end
    
omegacustout = '';

omegacust = get(handles.MeasureOmegas, 'Value');
    if omegacust == 1
        omegacustout = 'CC';
    elseif omegacust == 0
        omegacustout = '';
    end
version = get(handles.Version2, 'Value');
    if version == 0
        home = ['java -Xmx15g -jar C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\chore.jar ' foldername ' '];
    elseif version == 1
        home = ['java -Xmx15g -cp C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\scala-library.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\Chore.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\IchiMwt.jar;C:\Users\Alkem\Desktop\Tools\MWT_Files\MWT_latest_1.3.0_r1035\MWT_1.3.0_r1035\analysis\commons-math3-3.1.1.jar Choreography ' foldername ];
    end
    
    outputs = [ampplug ' -o ' f D n N p e s S l L w W a A m M k b P c d x y u v o r t amp ];
    outputs = [outputs(1:end-1) customout omegacustout];
    outputs1 = { 'Time ', f1, D1, n1, N1, p1, e1, s1, S1, l1, L1, w1, W1, a1, A1, m1, M1, k1, b1, P1, c1, d1, x1, y1, u1, v1, o1, r1, t1, amp1};
    misc = [rescaled speedwind dataspace mintime mindistance fwddist lengthunits disptype spec];
    plugins = [shad ' -S' reout resp spinesfwd revoutput extract curvaceousout eigenout omegaout  senseout];
    urcodeout = ['-S' misc, outputs plugins cust];
    codeout = [home misc outputs plugins cust individualoutputs];
    set(handles.codehome, 'String', codeout);
    clipboard('copy', codeout);
    
end

