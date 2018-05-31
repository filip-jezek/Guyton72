% Varible declaration and initialization
AURG = 1;
RPS = 0;
AUTO = 0; % ACTIVATES AUTOMATIC RAPID AUTOREGULATION (IF > 0) [P]
if  AURG <= 0
     POZ = 0; 
     PON = 0; 
     POK = 0; 
     POM = 0; 
     POM2 = 0;
elseif AUTO > 0
     Z = 1; 
     STA = 1;  %%% 
     PAEX = 0;	
     POZ = 0; 
     PON = 0; 
     POK = 0; 
     POM = 0; 
     POM2 = 0;
else
     POZ = 2;       % SENSITIVITY CONTROL, LONG-TERM NONMUSCLE AUTOREGULATION [P]
     PON = 0.1;     % SENSITIVITY CONTROL, INTERMEDIATE NONMUSCLE AUTOREGULATION [P]
     POK = 0.1;     % SENSITIVITY CONTROL, RAPID NONMUSCLE AUTOREGULATION [P]
     POM = 0.04;    % SENSITIVITY CONTROL, RAPID MUSCLE AUTOREGULATION [P]
     POM2 = 2;      % SENSITIVITY CONTROL, LONG-TERM MUSCLE AUTOREGULATION [P]
     PAEX = 2;      % EXPONENTIAL FACTOR AFFECTING PAM [P]
     STA = 0;       % OVERRIDING VALUE OF OVERALL AUTONOMIC ACTIVITY [P]
     
end

if RPS > 0          % DOUBLES EXTRARENAL RESISTANCE (IF > 0)
       RAR = 60; 
       RAM = 180; 
else
       RAR = 30.52;        % BASAL NON-MUSCLE VASCULAR RESISTANCE [P]
       RAM = 96.3;         % BASAL MUSCLE VASCULAR RESISTANCE [P]
end



       %%%%%%%%%%%%% VASCULAR STRESS RELAXATION %%%%%%%%%%%%%%%%%%%
 
SR = 1;             % SENSITIVITY CONTROLLER, SHORT-TERM STRESS RELAXATION [P]
SR2 = 1;            % SENSITIVITY CONTROLLER, LONG-TERM STRESS RELAXATION [P]
SRK = 5;            % SHORT TIME CONSTANT FOR STRESS RELAXATION [P]
SRK2 = 10000;       % LONG TIME CONSTANT FOR STRESS RELAXATION [P]
VV6_IC = 0.00142782;          % INITIAL CONDITION FOR VV6 INTEGRATION LOOP 
VV7_IC = 0.000176183;         % INITIAL CONDITION FOR VV7 INTEGRATION LOOP 


%%%%%%%%%%%%%%%%% RED CELLS AND VISCOSITY %%%%%%%%%%%%%%%%%%

PO2AMB = 150;       % AMBIANT PO2
HMK = 90;           % PORTION OF BLOOD VISCOSITY DUE TO RED BLOOD CELLS
HKM = 0.53333;      % BLOOD VISCOSITY FACTOR CAUSED BY RED BLOOD CELLS
HM6 = 1850;         % ERYTHROPOIETIC LIMITER [P]
REK = 0.3;            % TOTAL FUNCTIONAL RENAL MASS, RATIO TO NORMAL [P]
HM8 = 4.714e-08;    % SENSITIVITY CONTROL FOR ERYTHROPOIESIS [P]
RKC = 5.8e-06;      % SENSITIVITY FOR RED BLOOD CELL DESTRUCTION [P]
VRC_IC = 2.0025;   % INITIAL CONDITION FOR VV7 INTEGRATION LOOP 
TRRBC = 0;          % RATE OF TRANSFUSION OF PURE RBC 
%%%%%%%%%%%%%%%%%%%% ANTIDIURETIC HORMONE %%%%%%%%%%%%%%%%%%%%
    
        %%%% ADH CALCULATION
ADHPUL = 85;        % ADHPA UPPER LIMIT [P]
CNR = 139;          % REFERENCE SODIUM CONC TO DETERMINE ADH SECRETION RATE [P]
ADHPAM = 0.3;       % SENSITIVITY CONTROL OF ARTERIAL PRESSURE ON ADH [P]
ADHINF = 0;         % RATE OF EXOGENOUS ADH INFUSION [P]

        %%%% ADHC DYNAMICS
ADHTC = 15;         % TIME CONSTANT, ADH SECRETION [P]
Z16 = 5;            % FACTOR FOR ADH CONCENTRATION [P]
ADHC_IC = 1.01449;        % INITIAL CONDITION FOR ADHC

        %%%% ADHMK CALCULTION
ADHKUL = 5;         % ADHMK UPPER LIMIT [P]
ADHKLL = 0.2;       % ADHMK LOWER LIMIT [P]

        %%%% ADHMV CALCULTION
ADHVUL = 2.5;       % ADHMK UPPER LIMIT [P]
ADHVLL = 0.93617;   % ADHMV LOWER LIMIT [P]


%%%%%%%%%%%%%%%%%%% ANGIOTENSIN %%%%%%%%%%%%%%%%%%%%%%%%%%

ANXM = 0;           % SENSITIVITY CONTROLLER OF ANX [P]
%REK
ANGINF = 0;         % RATE OF EXOGENOUS ANGIOTENSIN INFUSION [P]
ANGKNS = 0;         % OVERRIDING VALUE FOR ANGIOTENSIN SECRETION [P]
ANUM = 6;           % SENSITIVITY CONTROLLER OF ANU [P]
ANUVM = 0;          % SENSITIVITY CONTROLLER OF ANUVN [P]
ANULL = 0.8;        % ANU LOWER LIMIT [P]

    %%%% MDFLW3
MDFLWX = 0.01;      % SENSITIVITY CONTROLLER OF MDFL3 [P]
MDFLW3_IC = 1.00211;% MDFLW3 INITIAL CONDITION

    %%%% ANG SECRETION DYNAMICS
ANV = 5000;         % TIME CONSTANT, ANGIOTENSIN SECRETION [P]
ANX1_IC = 0;        % ANX1  INITIAL CONDITION

    %%%% PLASMA ANG CONCENTRATION
ANT = 12;           % TIME CONSTANT, ANGIOTENSIN ACCUMULATION AND DESTRUCTION [P]
ANC_IC = 0.867681; %0.867681;         % ANC  INITIAL CONDITION
Z12 = 5;            % DAMPING FACTOR, ANGIOTENSIN SYSTEM [P]

    %%% ANM CALCULATION
ANMUL = 1.8;        % ANM UPPER LIMIT [P]
ANMLL = 0.7;        % ANM LOWER LIMIT [P]
ANCSNS = 0.4;       % SENSITIVITY CONTROLLER OF ANM [P]

%%%%%%%%%%%%%%%%%%%%%%%% VOLUME RECEPTOPS %%%%%%%%%%%%%%%%%%%%

AH10 = 0.333;       % CURVE FITTING EXPONENT, RIGHT ATRIAL PRES. ON VOL RECEPTORS 
AH9 = 1;            % SENSITIVITY CONTROL OF AHZ [P]
ATRVM = 0;          % SENSITIVITY CONTROLLER OF ATRVFB
ATRFBM = 0;         % SENSITIVITY CONTROLLER OF ATRRFB

    %%% VOLUME RECEPTOR ADAPTATION
AH11 = 1000;        % TIME CONSTANT, VOLUME RECEPTOR ADAPTATION [P]
AHY_IC = -0.461862;         % AHY INITIAL CONDITION


%%%%%%%%%%%%% AUTOREGULATIORY LOCAL BLOOD FLOW CONTROL %%%%%%%%%%%%%%

    %%% NON-MUSCLE LOCAL BF CONTROL
% POZ = 2;          % SENSITIVITY CONTROL, LONG-TERM NONMUSCLE AUTOREGULATION [P]
% PON = 0.1;        % SENSITIVITY CONTROL, INTERMEDIATE NONMUSCLE AUTOREGULATION [P]
% POK = 0.1;        % SENSITIVITY CONTROL, RAPID NONMUSCLE AUTOREGULATION [P]
POR = 35;           % REFERENCE VALUE OF CAPILLARY PO2 IN NON-MUSCLE TISSUE [P]
AUTOSN = 0.9;       % OVERALL SENSITIVITY CONTROLLER, NONMUSCLE AUTOREG. [P]
            
            %%%% lONG-TERM AUTOREG.
A3K = 40000;        % TIME CONSTANT, LONG-TERM NONMUSCLE AUTOREGULATION [P]            
AR3_IC = 1.05777;         % INITIAL CONDITION FOR AR3 INTEGRATION LOOP 
            
            %%% INTERMEDIATE AUTOREG.
A2K = 60;           % TIME CONSTANT, INTERMEDIATE NONMUSCLE AUTOREGULATION [P]            
AR2_IC = 1.00306;         % INITIAL CONDITION FOR AR2 INTEGRATION LOOP     

            %%% RAPID AUTOREG.
A1K = 0.5;          % TIME CONSTANT, RAPID NONMUSCLE AUTOREGULATION [P]
AR1_IC = 1.00197;         % INITIAL CONDITION FOR AR1 INTEGRATION LOOP 


    %%%%% MUSCLE BLOOD FLOW CONTROL 
%POM = 0.04;         % SENSITIVITY CONTROL, RAPID MUSCLE AUTOREGULATION [P]
%POM2 = 2;           % SENSITIVITY CONTROL, LONG-TERM MUSCLE AUTOREGULATION [P]
AMM4 = 0.005;       % AMM1 LOWER LIMIT [P]

            %%% RAPID MUSCLE AUTOREG.
A4K = 0.1;          % TIME CONSTANT, RAPID MUSCLE AUTOREGULATION [P]
AMM1_IC = 1.00227;        % INITIAL CONDITION FOR AMM1 INTEGRATION LOOP 
            
            %%% LONG-TERM MUSCLE AUTOREG.
A4K2 = 40000;       % TIME CONSTANT, LONG-TERM MUSCLE AUTOREGULATION [P]
AMM2_IC = 1.09458;        % INITIAL CONDITION FOR AMM2 INTEGRATION LOOP 

%%%%%%%%%%%%%% AUTONOMIC CONTROL OF THE CIRCULATION %%%%%%%%%%%%%%%%%%%%

EXC = 1;            % LEVEL OF EXERCISE ACTIVITY [P]
EXCML =  0.01;      % SENSITIVITY CONTROLLER OF EXERCISE ON AUTONOMICS [P]
EXCXP = 1;          % CURVE FITTING EXPONENT, AUTONOMIC EFFECT OF EXERCISE [P]
AUL = 1.5;          % CURVE FITTING COEFFICIENT, CALCULATION VVR [P]
VV9 = 2.51;         % BASIC VENOUS VOLUME, WITHOUT AUTONOMIC DRIVE [P]
AUV = 0.55;         % BLOOD VOLUME SHIFTED FROM UNSTRESSED TO STRESSED
O2A = 0.1;          % SENSITIVITY CONTROLLER OF AOM, AUTONOMIC ON METABOLISM [P]
AUM1 = 3;           % CURVE FITTING COEFFICIENT, CALCULATION AUM [P]
AUM2 = 1;           % CURVE FITTING EXPONENT, CALCULATION AUM [P]
AUY = 0;            % SENSITIVITY OF SYMPATHETIC CONTROL OF VEINS
AUS = 1;            % SENSITIVITY OF SYMPATHETIC CONTROL OF HEART RATE [P]

    %%% AULP CALCULATION
AULPM = 0;          % SENSITIVITY CONTROLLER OF AULP [P]

    %%% AU CALCULATION
AUMAX = 5;          % MAXIMAL AUTONOMIC OUTPUT [P]
AUMIN = 0.4;        % MINIMAL AUTONOMIC OUTPUT [P]
AUSLP = 1.5;        % CURVE FITTING COEFFICIENT, CALCULATION AU [P]

         %%% AU1 CALCULATION
AUDMP = 0.3;        % DAMPING FACTOR FOR AU1 [P]
AU1_IC = 0.99999;         % AU1 INITIAL CONDITION

    %%% AUC3,AUN,AUC6 CALCULATION
    
EXE = 1;            % DRIVING PRESSURE ON AUTONOMIC DUE TO EXERCISE [P]
CRRFLX = 0;         % OVERRIDING VALUE OF PA1 (IF > 0) [P]
AUX = 1;            % SENSITIVITY CONTROLLER OF ARTERIAL BARORECEPTORS [P]
AUK = 0.004;        % TIME CONSTANT OF BARORECEPTOR ADAPTATION [P]
AU4_IC = -0.00833091;         % AU4 INITIAL CONDITI0N
MDMP = 0;           % DAMPING FACTOR OF AU6 [P]

        %%% AUC2 CALCULATION
O2CHMO  = 0.01;     % O2 CHEMORECEPTORS SENSITIVITY CONTROLLER [P]       
        
        %%% AUC CALCULATION
AUC1 = 0.3;         % SENSITIVITY CONTROLLER OF AUC [P]

        %%% AUN CALC.
AUN1 = 0.5;         % SENSITIVITY CONTROLLER OF AUN [P]

    %%% BARORECEPTOR RESETTING
BAROTC = 0.16;      % TIME CONSTANT, BARORECEPTOR (AU6) [P]
AU6_IC = 1.00041;         % AU6 INITIAL CONDITION




%%%%%%%%%%%%%%%%%%%% HEART HYPERTROPHY OR DETEORATION %%%%%%%%%

HSL = 1;            % BASIC STRENGTH OF LEFT VENTRICLE
HSR = 1;            % BASIC STRENGTH OF RIGHT VENTRICLE
Z13 = 0.625;        % EXPONENT CONTROLLING DEGREE OF HEART HYPERTROPHY [P]
DHDTR = 0.05;       % PROPORTIONALITY CONSTANT, CARDIAC DETERIORATION [P]
HMD_IC = 1;         % HMD INIT. COND.
    
    %%% HYPERTR. EFFECT ON LV
HPL_IC = 1.00165;         % HPL INIT. COND.

    %%% HYPERTR. EFFECT ON RV
HPR_IC = 1.0199;         % HPR INIT. COND.


%%%%%%%%%%%%%%%%%%% HEART RATE AND STROKE VOLUME %%%%%%%%%%%%%%%%%%%%

PR1LL = 0;          % PR1 LOWER LIMIT [P]


%%%%%%%%%%%%%%%%%% PULMONARY OXYGEN UPTAKE %%%%%%%%%%%%%%%%%%%%%%%%%%

PL2 = 1.8;          % CONSTANT, COMPUTATION OF RSPDFC [P]
VPTISS = 0.0175;    % PULMONARY TISSUE FLUID VOLUME [P]
%PO2AMB
OVA_IC = 204.426;   % OVA INIT. COND.
VNTSTM = 1;         % SENSITIVITY CONTROLLER FOR ALVEOLAR VENTILATION [P]

    %%% O2VAD1 DYNAMICS
O2VAD1_IC = 5.22431e-10;      % O1VAD1 INIT. COND.


%%%%%%%%%%%%%%%%%%%%% ALDOSTERONE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ALDMM = 2.5;        % SENSITIVITY CONTROLLER OF ALDOSTERONE MULTIPLIER [P]
AMKM = 0.5;         % SENSITIVITY CONTROLLER OF AMK [P]
AMNAM = 0.8;        % SENSITIVITY CONTROLLER OF AMNA [P]
AMNAUL = 15;        % AMNA UPPER LIMIT [P]
AMNALL = 0.04;      % AMNA LOWER LIMIT [P]
    
    %%% AMRBSC CALC.
ANMALD = 2.5;       % SENSITIVITY CONTROLLER, ANGIOTENSIN EFFECT ON ALDO SECRETION

    %%% AMR1 CALC.
AMKMUL = 12;        % SENSITIVITY CONTROLLER OF AMR [P]
ALDINF = 0;         % RATE OF EXOGENOUS ALDOSTERONE INFUSION [P]
ALDKNS = 0;         % OVERRIDING VALUE FOR ALDOSTERONE SECRETION [P]
    
    %%% ALDOST. cONCENTRATION
AMT = 60;           % TIME CONSTANT, ALDO ACCUMULATION AND DESTRUCTION [P]
AMC_IC = 1.05537;         % AMC INIT. COND. 

    %%% AM1 CALC.
AM1UL = 5;          % AM1 UPPER LIMIT [P]
AM1LL = 0;          % AM1 LOWER LIMIT [P]
AMCSNS = 0.65;      % SENSITIVITY CONTROLLER, ALDOSTERONE SECRETION [P]

%%%%%%%%%%%%%%%%%% THIRST, DRINKING AND SALT APETITE %%%%%%%%%%%%%%%%%%%

DR = 0;             % RATE OF WATER DRINKING (IN ADDITION OF THIRST)

    %%% AHTH CACL.
AHTHM = 2;          % SENSITIVITY CONTROLLER, EFFECT OF ADH ON THIRST [P]

    %%% STH CACL.
Z10 = 45;           % DAMPING FACTOR, STH [P]
Z11 = 0.01;         % DAMPING FACTOR, STH [P]
ANMSLT = 2;         % SENSITIVITY CONTROLLER ANMSML [P]

    %%% ANMTH CACL.
ANMTM = 1.5;        % SENSITIVITY CONTROLLER OF ANMTH [P]

    %%% RATE OF DRINKING
TVDDL = 30;         % TVD DAMPING COEFFICIENT [P]
TVD_IC = 0.000981653;         % TVD INIT. COND.


%%%%%%%%%%%%%%%%%%%%% MUSCLE OXYGEN DELIVERY %%%%%%%%%%%%%%%%%%%%%

EXC = 1;            % LEVEL OF EXERCISE ACTIVITY [P]
EXCXP2 = 0.17;      % EXPONENT FACTOR OF EXERCISE ON MUSCLE METABOLISM [P]
PM5 = 30;           % CONSTANT, TO CHANGE MUSCLE CAPILLARITY [P]
PK2 = 0.79167;      % PROPORTIONALITY CONSTANT, MUSCLE TISSUE PO2 [P]
OMM = 57.1;         % BASIC O2 UTILIZATION IN MUSCLE TISSUES (AT REST) [P]
QOM_IC = 48.0702;         % QOM INIT. COND.

    %%% DAMPING Z6
Z6 = 20;            % DAMPING FACTOR FOR MUSCLE VENOUS SATURATION [P]
OVS_IC = 0.699512; % 0.699512;         % OVS INIT. COND.


%%%%%%%%%%%%%%%%%%%%%%% NON-MUSCLE OBYGEN DELIVERY %%%%%%%%%%%%%%%%%%%%%

QO2_IC = 72.0485;         % QO2 INIT. COND.
O2M = 164;          % BASIC O2 UTILIZATION IN NONMUSCLE TISSUES

    %%% DAMPING Z7
Z7 = 5;             % DAMPING FACTOR FOR NONMUSCLE VENOUS SATURATION [P]
OSV_IC = 0.692888;         % OSV INIT. COND. 


%%%%%%%%%%%%%%%%%%% ATRIAL NATRIURETIC PEPTIDE %%%%%%%%%%%%%%%%%%%%%%%

ANPINF = 0;         % RATE OF EXOGENOUS ANP INFUSION
ANPKNS = 0;         % OVERRIDING VALUE OF ANP SECRETION RATE
ANPXUL = 10;        % ANPX UPPER LIMIT [P]

    %%% ANPC ACCUMUL. AND DESTRUCTION
ANPTC = 4;          % TIME CONSTANT, ANP ACCUMULATION AND DESTRUCTION [P]
ANPC_IC = 0.9333;   % ANPC INIT. COND. 
Z14 = 5;            % DAMPING FACTOR FOR ANP CONCENTRATION [P]

%%%%%%%%%%%%%%%%%%%% PULMONARY FLUID DYNAMICS %%%%%%%%%%%%%%%%%%%%%%

CPF = 0.0003;       % PULMONARY CAPILLARY FILTRATION COEFFICIENT [P]
VPF_IC = 0.0125388; % VPF INIT. COND.
PPR_IC = 0.378754;  % PPR INIT. COND.

    %%% DAMPING Z19
Z19 = 5;            % DAMPING FACTOR FOR DFP [P]
DFP_IC = 1.16492e-06;         % DFP INIT. COND.

    %%% DAMPING Z18
Z18 = 5;            % DAMPING FACTOR FOR PPD [P]
PPD_IC = 7.39486e-06;         % PPD INIT. COND.


%%%%%%%%%%%%%%%%% ELECTROLYTES %%%%%%%%%%%%%%%%%%%%%%%%%

TRPL = 0;           % TRANSFUSION COEFFICIENT [P]
NID = 0.9;          % RATE OF SODIUM INTAKE
NAE_IC = 2128.5;    % NAE INIT. COND.
ALCLK = 0.3;        % SENSITIVITY CONTROLLER OF AMK1 [P]
KTOT_IC = 3627.42;  % KTOT INIT. COND.
VIDML = 0.01;       % PROPORTIONALITY CONSTANT, CCD TO VID [P]
VIC_IC = 25.0691;   % VTW INIT. COND.
VTW_IC = 40.054;    % VTW INIT. COND.
KID = 0.08;         % RATE OF POTASSIUM INTAKE


%%%%%%%% CAPILLARY DYNAMICS, TISSUE FLUID AND TISSUE PROTEIN %%%%%%%%%%%%%%

%TRPL
CFC = 0.01167;      % CAPILLARY FILTRATION COEFFICIENT [P]
PRP_IC = 216.068;         % PRP INIT. COND.
VP_IC = 3.00112;          % VP INIT. COND.
TSP_IC = 280.752;         % TSP INIT. COND.
GCOPF = 0.8092;     % COEFFICIENT, CALCULATION OF PTC [P]
PGHF = -2;          % PROPORTIONALITY COEFFICENT, CHY TO PGH [P]
PLDF = 4.2;         % CONSTANT PRESSURE, COMPUTATION OF PLD [P]


    %%% VTCPL CALCULATION
PCR = 15;           % CRITICAL CAPILLARY PRESSURE FOR PROTEIN LEAKAGE [P]
CPK = 0.000253;     % CURVE FITTING EXPONENT, , CAPILLARY LEAKAGE [P]
PCE = 1;            % CURVE FITTING EXPONENT, CAPILLARY LEAKAGE [P]

    %%% DLP CALCULATION
CPR = 40;           % CRITICAL PLASMA PROTEIN CONC FOR PROTEIN DESTRUCTION [P]
LPDE = 8;           % CURVE FITTING COEFFICIENT, LIVER PROTEIN DESTRUCTION [P]
LPK = 2.728e-14;    % CURVE FITTING COEFFICIENT, LIVER PROTEIN DESTRUCTION [P]
LPPR = 0.03;        % RATE OF LIVER PROTEIN PRODUCTION [P]

    %%% CHY CALCULATION
HYL = 60;           % QUANTITY OF HYALURONIC ACID IN TISSUES
CMPTSS = 2;         % QUANTITY OF HYALURONIC ACID IN TISSUES

    %%% VTS1 CALCULATION
TSSLML = 0.15;      % SENSITIVITY CONTROLLER OF VTS [P]
        
        %%% VTS2 DYNAMICS
TSSLTC = 0.005;     % VTS1 TIME CONSTANT [P]
VTS2_IC = -0.0042767;        % VTS2 INIT. COND.

    %%% PTT CALCULATION
VTSF = 6;           % CURVE FITTING COEFFICIENT, PTT [P]


%%%%%%%%%%%%%%%%%%%%%%%% KIDNEYS %%%%%%%%%%%%%%%%%%%%%%%%

%REK
AHMNAR = 0.3;       % SENSITIVITY CONTROL, RENAL EFFECT OF ADHMK [P]
RTPPRS = 15.2;      % RENAL ONCOTIC, INTERNAL VAR [P]
RTPPR = 0.9;        % RENAL ONCOTIC, INTERNAL VAR [P]
DTNAR = 0.675;      % SENSITIVITY CONTROLLER OF DTNARA [P]
DIURET = 1;         % DIURETIC EFFECT ON TUBULAR REABSORPTION [P]
RTSPRS = 6;         % RENAL TISSUE FLUID PRESSURE [P]
GFLC = 0.0208333;   % GLOMERULAR FILTRATION COEFFICIENT [P]
PXTP = 8;           % PROXIMAL TUBULAR HYDROSTATIC PRESSURE [P]
RFABKM = 0.03;      % PROPORTIONALITY CONSTANT, RFABK [P]
DTNARL = 1e-06;     % LOWER LIMITER OF DTNARA [P]
CKEEX = 4;          % CURVE FITTING EXPONENT, DISTAL POTASSIUM REABSORPTION [P]
AARK = 1;           % BASIC AFFERENT ARTERIOLAR RESISTANCE [P]
EARLL = 24;         % LOWER LIMIT FOR EAR [P]
EARK = 1;           % BASIC EFFERENT ARTERIOLAR RESISTANCE [P]

    %%% DTURI/UROD CALCULATION
URFORM = 0.24;      % RATE OF UREA FORMATION
PLUR_IC = 160.148;        % PLUR INIT. COND.  

    %%% DTNANG CALCULATION
ANMNAM = 1;         % SENSITIVITY CONTROLLER OF DTNANG [P]

    %%% ANMKE CALCULATION
ANMKEM = 2;         % SENSITIVITY CONTROLLER OF ANMKE [P]
ANMKEL = 0.3;       % ANMKE LOWER LIMIT [P]

    %%% MDFLK CALCULATION
MDFLKM = 0.667;     % SENSITIVITY CONTROLLER OF MDFLK [P]

    %%% AAR CALCULATION
ANPXAF = 1.5;       % SENSITIVITY FACTOR OF ANP ON RENAL AFFERENT RESISTANCE [P]
AARLL = 4;          % AAR LOWER LIMIT [P]

    %%% AUMK CALCULATION
ARF = 0.5;          % SENSITIVITY CONTROLLER OF AUMK [P]

    %%% RANUG2T CALCULATION
EFAFR = 0;          % EFFERENT ARTERIOLAR FEEDBACK, SENSITIVITY CONTROLLER [P]

    %%% AUMKT CALCULATION
AUMK1 = 0.3;        % AUTONOMIC SENSITIVITY CONTROLLER ON EAR [P]

    %%% ANMAR/ANMER CALCULATION
ANMEM = 1.6;        % SENSITIVITY EFFECT OF ANGIOTENSIN ON EFFERENT ARTERIOLES [P]
ANMAM = 1.4;        % SENSITIVITY EFFECT OF ANGIOTENSIN ON AFFERENT ARTERIOLES [P]
ANMARL = 0.86;      % ANMAR LOWER LIMIT [P]

    %%% RNAUG2 CALCULATION
RNAUAD = 0;         % RENAL AUTOREGULATION, ADAPTATION CONTROLLER [P]
RNAUG3_IC = 0;      % RNAUG3 INIT. COND.  

    %%% RNAUG1 CALCULATION
RNAUGN = 0.6;       % BASAL RENAL AUTOREGULATION FEEDBACK MULTIPLIER
RNAUUL = 10;        % RNAUG1 UPPER LIMIT
RNAULL = 0.3;       % RNAUG1 LOWER LIMIT
        
        %%% RNAUG1 DYNAMICS
RNAGTC = 15;        % TIME CONSTANT, RENAL AUTOREGULATION FEEDBACK [P]
RNAUG1_IC = 1.00088;      % RNAUG1 INIT. COND.

    %%% GFN DAMPING
GFNDMP = 3;         % GFN DAMPING COEFFICIENT [P]
GFNLL = 0.001;      % GFN LOWER LIMIT [P]
GFN_IC = 0.125022;          % GFN INIT. COND.
    %%% MDFLW CALCULATION
MDFL1 = 10;         % SENSITIVITY CONTROLLER OF MDFLW [P]

    %%% RFABD CALCULATION
RABSC = 0.5;        % PERITUBULAR CAPILLARY REABSORPTION COEFFICIENT [P]
RFABDM = 0.3;       % SENSITIVITY CONTROLLER OF RFABD [P]
        %%% RFAB DYNAMICS
RFABDP = 1;         % RFAB DAMPING FACTOR [P]
RFAB_IC = 0.840627; % RFAB INIT. COND.

    %%% RCPRS CALCULATION
RFABX = 0.8;        % No definition available
RVRS = 19.167;      % CURVE FITTING COEFFICIENT, RCPRS [P]

    %%% PAR CALCULATION
GBL = 0;            % GOLDBLATT PRESSURE CLAMP (MMHG)
RAPRSP = 0;         % OVERRIDING VALUE OF RENAL ARTERIAL PRESSURE (IF > 0) [P]
RCDFPC = 0;         % RENAL FUNCTION CURVE DRIFT COEFFICIENT [P]
RFCDFT = 0;         % RENAL FUNCTION CURVE DRIFT FACTOR (IF > 0) [P]

        %%% PAR TF
RCDFDP = 2000;      % RENAL FUNCTION CURVE DRIFT DAMPING FACTOR [P]
PAR_IC = 100.477;         % PAR INIT. COND.

   %%% GLPC CALCULATION
GLPCA = 1;          % IF > 0, ACTIVATES GLPC COMPUT. DUE TO FILTRATION FRACTION
        
        %%% GLPC DYNAMICS
GPPD = 1;           % DAMPING COEFFICIENT GLPC [P]
GLPC_IC = 37.8681;        % GLPC INIT. COND.

    %%% DTKA DYNAMICS
DTKA_IC = 0.0368507; % 

%%%%%%%%%%%%%%%%%%%%% CIRCULATORY DYNAMICS %%%%%%%%%%%%%%%%%%%%%%%%%%%%

TENSGN = 0;         % GAIN, MYOGENIC AUTOREGULATION [P]
KORNER = 0;         % ACTIVATES KORNER'S CONCEPT (IF > 0) [P]
KORREN = 0;         % KORNER EFFECT ALSO ON AFFERENT ARTERIOLES (IF > 0) [P]
%PAEX = 2;          % EXPONENTIAL FACTOR AFFECTING PAM [P]
%RAM = 96.3;        % BASAL MUSCLE VASCULAR RESISTANCE [P]
HTAUML = 0.4;       % AUTONOMIC SENSITIVITY ON PRA [P]
QRF = 0.15;         % LEFT VENTRICLE FUNCT EFFECT ON RIGHT VENTRICLE FUNCTION [P]
CV = 0.1;           % VENOUS COMPLIANCE [P]
ANY = -0.2;         % SENSITIVITY CONTROLLER OF ANU FOR VENOUS VOLUME [P]
FIS = 0;            % FISTULA CONDUCTANCE FACTOR
U = 4;              % DAMPING COEFFICIENT, CIRCULATION [P] 
X = 4;              % DAMPING COEFFICIENT, CIRCULATION [P]            
%RAR = 30.52;       % BASAL NON-MUSCLE VASCULAR RESISTANCE [P]
QLO_IC = 4.99739;   % LEFT VENTRICULAR OUTPUT

%PR1LL - ALREADY DEFNED IN HR AND SV
%HSL
%HSR
VVS_IC = 3.26583;             % INIT. COND. 1
VRA_IC = 0.0994728;            % INIT. COND. 2
VPA_IC = 0.38598;            % INIT. COND. 3
VLA_IC = 0.399985;            % INIT. COND. 4
VAS_IC = 0.851692;            % INIT. COND. 5

    %%% RAD TF
TENSTC = 0.05;      % TIME CONSTANT, MYOGENIC AUTOREGULATION [P]
RAD_IC = 1;         % RAD INIT. COND.
    
    %%% PAMK CALCULATION
KORGN = 1;          % GAIN OF POSITIVE FEEDBACK, KORNER CONCEPT [P]

        %%% PAMK DYNAMICS
KORTC = 10000;      % TIME CONSTANT, KORNER EFFECT [P]
PAMK_IC = 1;        % PAMK INIT. COND.
      
    %%% RV1 CALCULATION
CN7 = 0.2;          % CURVE FITTING COEFFICIENT, CALCULATION OF CN3 [P]
CN2 = 0.0212;       % CURVE FITTING COEFFICIENT, CALCULATION OF CN3 [P]
RVSM = 1;           % BASAL SYSTEMIC VENOUS MULTIPLIER [P]

        %%% DAMPING
CN3_IC = 0.359907;         % CN3 INIT. COND.

    %%% RMULT1 CALCULATION
AUTOGN = 7;         % GAIN OF VERY RAPID AUTOREGULATION (SPECIAL EXP.) [P]
AUTOK = 0.1;        % RATE OF DEVELOPMENT OF VERY RAPID AUTOREGULATION
RMULT1_IC = 1;      % VERY RAPID AUTOREGULATION MULTIPLIER (IF AUTO > 0) INIT. COND
% AUTO = 0;           % ACTIVATES AUTOMATIC RAPID AUTOREGULATION (IF > 0) [P]

    %%% QRN CALCULATION
%HTAUML - ALREADY DEFIEND

Z5 = 0.3;
Z4 = 0.5;
I6 = 0.1;

% %%%%%%%%%%%%% OTHER INITIAL CONDITIONS %%%%%%%%%%%%%%%
%     %%%% CIRCULATION OUTPUTS %%%%
% BFN = 2.7882; % 
% BFM = 0.993622; % 
% MYOGRS = 1; % 
% PPA = 16.6105; % 
% PVS = 3.6995; % 
% PAMKRN = 1; % 
% PLA = 1.9985; % 
% PRA = -0.105443; % 
% PA = 100.477; % 
% QAO = 5.00209; % 
% QLO = 4.99739; %
% QRO = 4.99916; % 
% RVS = 2.77914; % 
% RPA = 1.52167; % 
% RPV = 1.40067; % 
% VVE = 0.73995; % 
% 
%     %%%% KIDNEYS OUTPUTS %%%%
% GFR = 0.125022; % 
% KOD = 0.0799422; % 
% MDFLW = 1.00173; % 
% NOD = 0.0965046; % 
% RBF = 1.2199; % 
% VUD = 0.000978821; % 
% UROD = 0.239981; %
% 
%     %%%% PULMONARY OXYGEN UPTAKE %%%%
%     
% PO2ART = 97.0101; % 
% OVA = 204.426; % 
% OSA = 0.972816; % 
% 
%     %%%% RED CELLS AND VISCOSITY %%%%
% HM = 40.0264; % 
% VRC = 2.0025; % 
% VIM = 1.0005; % 
% VB = 5.00296; % 
% 
%     %%%% STRESS RELAXATION %%%%
% VV6 = 0.00142782; % 
% VV7 = 0.000176183; % 
% 
%     %%%% ADH %%%%
% ADHMK = 1.00964; % 
% ADHMV = 1.00089; % 
% ADHC = 1.01449; % 
% 
%     %%%% CAPILLARY DNAMICS %%%%
% CPP = 71.9953; % 
% PPC = 30.007; % 
% PC = 16.8725; % 
% PTS = 4.01905; % 
% VIF = 0.59856; % 
% VP = 3.00112; % 
% VTS = 11.9712; % 
% 
%     %%%% ELECTROLYTES %%%%
% CKE = 4.43855; % 
% CNA = 142.044; % 
% VEC = 14.9849; % 
% VIC = 25.0691; % 
% VID = 0; % 
% 
%     %%%% VOLUME RECEPTORS %%%%
% ATRVFB = 0; %
% ATRRFB = 1; % 
% 
%     %%%% ANP %%%%
% ANPX = 0.689498; % 
% 
%     %%%% AUTONOMICS %%%%
% AUH = 0.999997; % 
% AUM = 0.999986; % 
% AOM = 1; % 
% AUR = 0.999995; % 
% AVE = 1; % 
% PA1 = 100.477; % 
% VVR = 2.51001; % 
% AU = 0.999995; % 
% 
%     %%%% MUSCLE OXYGEN DELIVERY %%%%
% PMO = 38.0558; % 
% P2O = 38; % 
% RMO = 57.064; % 
% 
%     %%%% NON-MUSLCE OXYGEN DELIVERY %%%%
% POT = 35.0235; % 
% DOB =  163.758; % 
% POV = 39.5916; % 
% 
%     %%%% HEART HYPERTROPHY OR DETEORATION %%%%
% HPL = 1.00165; %
% HPR = 1.0199; % 
% HMD = 1; % 
% 
%     %%%% HR AND SV %%%
% HR = 71.9997; % 
% SVO = 0.0694085; % 
% 
%     %%%% PULMONARY FLUID DYNAMICS %%%%
% PPD = 0; % 
% VPF = 0.0125388; % 
% DFP = 0; % 
% 
%     %%%% ANGIOTENSIN %%%%
% ANM = 0.988283; % 
% ANU = 0.929698; % 
% ANUVN = 1; % 
% 
%     %%%% ALDOSTERONE %%%%
%     
% AMNA = 1.05717; % 
% AMK = 1.03573; % 
%  
%     %%%% THIRST, DRINKING AND SALT APETITE %%%%
% STH = 0.971979; % 
% TVD = 0.000981653; %
% 
%     %%%% AUTOREGULATORY LOCAL BF CONTROL %%%%
% AMM = 1.09707; % 
% ARM = 1.05679; % 