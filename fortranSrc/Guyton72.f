      program Guyton72
c       R67093,8 LARRY NEAL--MATHJ NASA FILE
c
c       PROGRAM GUYTON
c       CIRCULATORY DYNAMICS - CIRCE
c       CIRCEI

c       include when during implementation to check types and whether
c       variables are declared to avid typos:
        INCLUDE 'declarations.inc'
c       include finally:
c        INCLUDE 'noDeclarations.inc'
        DATA FUN1(1),FUN1(2),FUN1(3),FUN1(4),FUN1(5),FUN1(6),FUN1(7),
     *  FUN1(8),FUN1(9),FUN1(10),FUN1(11),FUN1(12),FUN1(13),FUN1(14)/
     *  0.0,1.04,60.0,1.025,125.0,0.97,160.0,0.88,200.0,0.59,240.0,
     *  0.0,240.0,0.0/
        DATA FUN2(1),FUN2(2),FUN2(3),FUN2(4),FUN2(5),FUN2(6),FUN2(7),
     *  FUN2(8),FUN2(9),FUN2(10),FUN2(11),FUN2(12),FUN2(13),FUN2(14)/
     *  -100.0,0.0,-6.0,0.0,-3.0,0.75,-1.0,2.6,2.0,9.8,8.0,13.5,1000.0,
     *  13.5/
        DATA FUN3(1),FUN3(2),FUN3(3),FUN3(4),FUN3(5),FUN3(6),FUN3(7),
     *  FUN3(8),FUN3(9),FUN3(10),FUN3(11),FUN3(12),FUN3(13),FUN3(14)/
     *  0.0,1.06,20.0,0.97,24.0,0.93,30.0,0.8,38.0,0.46,45.0,0.0,45.0,
     *  0.0/
        DATA FUN4(1),FUN4(2),FUN4(3),FUN4(4),FUN4(5),FUN4(6),FUN4(7),
     *  FUN4(8),FUN4(9),FUN4(10),FUN4(11),FUN4(12),FUN4(13),FUN4(14)/
     *  -100.0,0.0,-4.0,0.0,-1.0,3.6,3.0,9.4,6.0,11.6,10.0,13.5,
     *  1000.0,13.5/
        DATA FUN6(1),FUN6(2),FUN6(3),FUN6(4),FUN6(5),FUN6(6),FUN6(7),
     *  FUN6(8),FUN6(9),FUN6(10),FUN6(11),FUN6(12),FUN6(13),FUN6(14)/
     *  -100.0,10000.0,0.0,70.0,0.4,9.3,0.8,3.3,1.2,1.3,1.6,0.43,100.0,
     *  0.0/
        DATA FUN7(1),FUN7(2),FUN7(3),FUN7(4),FUN7(5),FUN7(6),FUN7(7),
     *  FUN7(8),FUN7(9),FUN7(10),FUN7(11),FUN7(12),FUN7(13),FUN7(14)/
     *  0.0,7.0,30.0,6.25,60.0,3.0,100.0,1.0,160.0,0.15,400.0,0.05,
     *  400.0,0.05/

c     Open the result file:
      open (102, FILE = 'Guiton72Results.txt', ACTION = 'WRITE')
      write(102,5)
      write(6,5)
    5 FORMAT  (/'GUYTON MODEL FROM WHITE'/
     *   '   REFER TO GE-AGS USER GUIDE TIR 741-MED-3017'//)
      INCLUDE 'ParamsAndStart.inc'

      IF (I .GT. 0.5) I = 0.5
100   IF(OUT .EQ. 3.0) CALL PUTOUT

      T = T+I2
      CALL HEMO(AMM,ANM,ANU,ANY,ANZ,ARM,AUH,AUM,AUY,AVE,BFM,BFN,
     *          CN2,CN3,CN7,CV ,DAS,DLA,DPA,DRA,DVS,FIS,HMD,HPL,
     *          HPR,HSL,HSR,I2,LVM,PA,PAM,PA2,PC,PGL,PGS,PLA,
     *          PPA,PP1,PP2,PRA,PR1,PVS,QAO,QLN,QLO,QPO,QRF,QRN,
     *          QRO,QVO,RAM,RAR,RBF,RPA,RPT,RPV,RSM,RSN,RVG,RVM,
     *          RVS,U  ,VAE,VAS,VBD,VIM,VLA,VLE,VP,VPA,VPE,VRA,
     *          VRC,VRE,VVE,VVR,VVS,VV7,VV8,X,FUN1,FUN2,FUN3,
     *          FUN4)

120   CALL AUTO(AU,AUB,AUC,AUH,AUJ,AUK,AUL,AUM,AUN,AUO,AUP,AUQ,
     *         AUR,AUS,AUV,AUX,AUZ,AU4,AU6,AU8,A1B,DAU,EXC,EXE,
     *         EX1,I2,PA,PA1,POQ,POT,P2O,STA,VVR,VV9,Y,Z,Z8,Z12)

      IF(I3.LE.I2)GO TO 168
      IF(ABS(DAU-AUJ).GT.DA1)GO TO 100
110   IF(ABS(QAO-QLO).GT.0.2)GO TO 100
      IF(ABS(QAO-QPO).GT.0.2)GO TO 100
      IF(ABS(QAO-QRO).GT.0.4)GO TO 100


168   CALL HORMON(AM,AMC,AMP,AMR,AMT,AM1,ANM,CKE,PA,Z,FUN7,
     *AGK,ANC,ANP,ANR,ANT,ANV,ANW,AN1,CNA,CNE,GFN,
     *I  ,REK)

170   CALL BLOOD(HKM,HM,HMK,I,POT,POY,PO1,PO2,RC1,RC2,RCD,RKC,
     *           VB,VIB,VIE,VIM,VP,VRC)

180   CALL MUSCLE(ALO,AMM,AOM,AUP,A4K,BFM,EXC,HM,I,MMO,OMM,OSA,
     *             OVA,OVS,O2A,PDO,PK1,PK2,PK3,PMO,PM1,PM3,PM4,PM5,
     *              POE,POM,PVO,P2O,QOM,RMO,VPF,Z5,Z6)

      CALL AUTORG(AOM,ARM,AR1,AR2,AR3,A1K,A2K,A3K,BFN,DOB,HM,I,
     *             MO2,OSV,OVA,O2M,POA,POB,POC,POD,POK,PON,POR,POT,
     *             POV,POZ,P1O,QO2,RDO,Z,Z4,Z7)


      CALL ADH(AH,AHC,AHK,AHM,AHY,AHZ,AH7,AH8,AUP,CNA,CNB,CNR,
     *       CNZ,I,PRA,Z)

      CALL MISC1(AHM,AU4,AU8,I,SR,SRK,STH,TVD,TVZ,VEC,VIC,VTW,
     *         VVE,VV6,VV7,Z )

      CALL HEART(AUR,DHM,HMD,HR,I,PA,PMC,PMP,PMS,POT,PRA,QAO,
     *           QLO,RTP,SVO,VAE,VLE,VPE,VRE,VVE)

      CALL CAPMBD(BFN,CFC,CPI,CPP,DFP,I,IFP,PC,PCD,PIF,PLD,PPC,
     *              PRP,PTC,PTS,PTT,PVG,PVS,RVS,TVD,VG,VID,VIF,VP,
     *              VPD,VTC,VTD,VTL,VTS,VUD,Z,Z1,FUN6)

      I=I*1.2+T-T1
      I1=ABS(VP1/VPD/I)
      IF(I1.LT.I) I=I1
      IF(I3+T-T1.LT.I) I=I3+T-T1
      T=I+T1
      T1=T

      if(OUT.EQ.4.0) CALL PUTOUT

  200 CALL PULMON(CPF,CPP,CPN,DFP,I,PCP,PFI,PLA,PLF,POS,PPA,PPC,
     *              PPD,PPI,PPN,PPO,PPR,VP,VPD,VPF,Z,Z3)

      CALL MISC2(HPL,HPR,HSL,HSR,I,PA,PPA,POT,STH,Z10,Z11,Z13)

  135 CALL PROTEN(CHY,CPG,CPI,CPK,CPP,CPR,CP1,DLP,DLZ,DPC,DPI,DPL,
     *            DPO,DPY,GPD,GPR,I,IFP,LPK,PC,PCE,PGX,PRP,VG,
     *            VTL,Z,PPD)

  142 CALL KIDNEY(AAR,AHM,AM,APD,ARF,AUM,CNE,CNX,CNY,GBL,GFN,GFR,
     *            GF2,GF3,GF4,GLP,I,NAE,NED,NID,NOD,NOZ,PA,PAR,PFL,
     *            PPC,RBF,REK,RFN,RR,STH,TRR,VIM,VUD,Z)

  160 CALL IONS(AM,CCD,CKE,CKI,CNA,I,KCD,KE,KED,KI,KID,KIE,
     *          KIR,KOD,NAE,REK,VEC,VIC,VID,VP,VPF,VTS,Z)

  140 CALL GELFLD(CHY,CPG,CPI,GPR,HYL,IFP,PGC,PGH,PGP,PGR,PGX,PIF,
     *       PRM,PTC,PTS,PTT,VG,VGD,VIF,VTS,V2D,FUN6)
      GO TO 100

c TODO how to stop the simulation and close the output file?
      close(102)
      end program Guyton72

      subroutine HEMO(AMM,ANM,ANU,ANY,ANZ,ARM,AUH,AUM,AUY,AVE,BFM,BFN,
     *          CN2,CN3,CN7,CV ,DAS,DLA,DPA,DRA,DVS,FIS,HMD,HPL,
     *          HPR,HSL,HSR,I2,LVM,PA,PAM,PA2,PC,PGL,PGS,PLA,
     *          PPA,PP1,PP2,PRA,PR1,PVS,QAO,QLN,QLO,QPO,QRF,QRN,
     *          QRO,QVO,RAM,RAR,RBF,RPA,RPT,RPV,RSM,RSN,RVG,RVM,
     *          RVS,U  ,VAE,VAS,VBD,VIM,VLA,VLE,VP,VPA,VPE,VRA,
     *          VRC,VRE,VVE,VVR,VVS,VV7,VV8,X,FUN1,FUN2,FUN3,
     *          FUN4)
      DIMENSION FUN1(14),FUN2(14),FUN3(14),FUN4(14)
      REAL I2,LVM
C
C     CIRCULATORY DYNAMICS BLOCK
C     HEMODYNAMICS
C
        VBD=VP+VRC-VVS-VAS-VLA-VPA-VRA
        VVS=VVS+DVS*I2+VBD*0.3986
        VPA=VPA+DPA*I2+VBD*0.155
        VAS=VAS+DAS*I2+VBD*0.261
        VLA=VLA+DLA*I2+VBD*0.128
        VRA=VRA+DRA*I2+VBD*0.0574
        VAE=VAS-0.495
        PA=VAE/0.00355
        PAM=100./PA
        PA2=PA/AUH
        CALL FUNCTN(PA2,LVM,FUN1)
        VRE=VRA-0.1
        PRA=VRE/0.005
        CALL FUNCTN(PRA,QRN,FUN2)
        VPE=VPA-0.30625
        PPA=VPE/0.0048
        PP1=0.026*PPA
        IF(PP1.LT.0.)PP1=0.
        RPA=PP1**(-0.5)
        PP2=PPA/AUH
        CALL FUNCTN(PP2,RVM,FUN3)
        VLE=VLA-0.4
        PLA=VLE/0.01
        CALL FUNCTN(PLA,QLN,FUN4)
        RPV=1./(PLA+20.)/0.0357
        RPT=RPV+RPA
        PGL=PPA-PLA
        QPO=PGL/RPT
        ANU=ANM
        IF(ANU.LT.0.8)ANU=0.8
        VVE=VVS-VVR-(ANU-1.)*ANY
        VV8=VVE-VV7
        IF(VV8.LT.0.0001)VV8=0.0001
        PVS=VV8/CV
        PR1=PRA
        IF(PRA.LT.0.)PR1=0.
        RVG=2.738/PVS
        QVO=(PVS-PR1)/RVG
        CN3=CN3+(((PC-17.)*CN7+17.)*CN2-CN3)*0.1
        AVE=(AUM-1.)*AUY+1.
        RVS=AVE*(1./CN3)*VIM*((ANU-1.)*ANZ+1.)
        PGS=PA-PVS
        RSN=RAR*ARM*ANU*AUM*PAM*VIM+RVS*1.79
        BFN=PGS/RSN
        RSM=ANU*VIM*PAM*AUM*AMM*RAM
        BFM=PGS/RSM
        QAO=BFN+BFM+RBF+(PA-PRA)*FIS
        QLO=LVM*QLN*AUH*HSL*HMD*HPL
        QRO=QRN*((1.-QRF)*AUH*RVM*HSR*HMD*HPR+QRF*QLO/QLN)
        QPO=QLO+(QPO-QLO)/U
        QVO=QRO+(QVO-QRO)/X
        DVS=QAO-QVO
        DPA=QRO-QPO
        DAS=QLO-QAO
        DLA=QPO-QLO
        DRA=QVO-QRO
      return
      end

      SUBROUTINE AUTO(AU,AUB,AUC,AUH,AUJ,AUK,AUL,AUM,AUN,AUO,AUP,AUQ,
     *         AUR,AUS,AUV,AUX,AUZ,AU4,AU6,AU8,A1B,DAU,EXC,EXE,
     *          EX1,I2,PA,PA1,POQ,POT,P2O,STA,VVR,VV9,Y,Z,Z8,Z12)
      REAL I2
c
c     AUTONOMIC CONTROL BLOCK
c

  120   EXE=(8.-P2O)*EX1+(EXC-1.)*Z12
        POQ=POT
        IF(POQ.GT.8.)POQ=8.
        IF(POQ.LT.4.)POQ=4.
        PA1=PA*POQ/8.-EXE
        AUC=0.
        IF(PA1.LT.80.)AUC=0.03*(80-PA1)
        IF(PA1.LT.40.)AUC=1.2
        AUB=0.
        IF(PA1.LT.170.)AUB=0.014286*(170.0-PA1)
c 170 -> 170.0
        IF(PA1.LT.40.)AUB=1.83
  123   A1B=(AUB-1.)*AUX+1.
  124   AUN=0.
        IF(PA1.LT.50.)AUN=0.2*(50.-PA1)
        IF(PA1.LT.20.)AUN=6.0
        AU6=A1B-AU4
        AU8=AUK*(AU6-1.)
        DAU=DAU+(AUC+AU6+AUN-DAU)/Z/Y
        AUJ=AUJ+(DAU-AUJ)*I2*6./Z8
        IF(AUJ.LT.0.)AUJ=0.
        IF(AUJ-1.)126,127,127
  126   AU=AUJ**AUZ
        GO TO 128
  127   AU=(AUJ-1.)*AUZ+1.
  128   IF(STA.GT.0.00001)AU=STA
        AUO=AU-1.
        AUP=AUO*AUQ+1.
        AUH=AUO*AUV+1.
        AUR=AUO*AUS+1.
        VVR=VV9-AUL*AUP
        AUM=0.15+0.85*AUP
      RETURN
      END

      SUBROUTINE HORMON(AM,AMC,AMP,AMR,AMT,AM1,ANM,CKE,PA,Z,FUN7,
     *AGK,ANC,ANP,ANR,ANT,ANV,ANW,AN1,CNA,CNE,GFN,
     *I  ,REK)
      DIMENSION FUN7(14)
      REAL I

c     ****************************************************************
c
c     ALDOSTERONE CONTROL BLOCK
c
c     ****************************************************************
  168   AMR=CKE/CNA/0.00352-9.
        IF(AMR.LT.0.)AMR=0.
        CALL FUNCTN(PA,AMP,FUN7)
c the call above was missing
        AM1=AM1+(ANM*AMP*AMR-AM1)/Z
        AMC=AMC+(AM1-AMC)*(1.-EXP(-I/AMT))
        AM=20.039-19.8*EXP(-0.0391*AMC)
c     ****************************************************************
c
c     ANGITENSIN CONTROL BLOCK
c
c     ****************************************************************
        CNE=152.0-CNA
        IF(CNE.LT.1.)CNE=1.
        ANR=((17.75-GFN*CNA)*AGK+1.)*REK
        ANW=ANW+((ANR-1.)*10.-ANW)*ANV*I
        IF(ANW.LT.0.)ANW=0.
        ANP=ANR+ANW
        IF(ANP.GT.100.)ANP=100.
        IF(ANP.LT.0.01)ANP=0.01
        AN1=AN1+(ANP-AN1)/Z
        ANC=ANC+(AN1-ANC)*(1.-EXP(-I/ANT))
        ANM=4.0-3.3*EXP(-0.0967*ANC)
        IF(ANM.LT.0.7)ANM=0.7
      RETURN
      END

      SUBROUTINE BLOOD(HKM,HM,HMK,I,POT,POY,PO1,PO2,RC1,RC2,RCD,RKC,
     *           VB,VIB,VIE,VIM,VP,VRC)
        REAL I
c
c     RED CELLS AND VISCOSITY BLOCK
c----------------------------------------------------------------------
c     BLOOD VISCOSITY
c----------------------------------------------------------------------
  170   VB=VP+VRC
        HM=100.*VRC/VB
        VIE=HM/(HMK-HM)/HKM
        VIB=VIE+1.5
        VIM=0.3333*VIB
        RC2=RKC*VRC
        PO2=PO1-POT
        IF(PO2.LT.0.2375)PO2=0.2375
        RC1=POY*PO2
        RCD=RC1-RC2
        VRC=VRC+RCD*I
      RETURN
      END


      SUBROUTINE MUSCLE(ALO,AMM,AOM,AUP,A4K,BFM,EXC,HM,I,MMO,OMM,OSA,
     *             OVA,OVS,O2A,PDO,PK1,PK2,PK3,PMO,PM1,PM3,PM4,PM5,
     *             POE,POM,PVO,P2O,QOM,RMO,VPF,Z5,Z6)
        REAL I,MMO
  180   OSA=ALO-VPF*0.5
        OVA=OSA*HM*5.
        OVS=OVS+((BFM*OVA-RMO)/HM/5./BFM-OVS)/Z6
        PVO=57.14*OVS
        RMO=(PVO-PMO)*PM5/(PM1**PK3-PM4)
        QOM=QOM+(RMO-MMO)*(1.-EXP(-I/Z5))
        PMO=PK2/(PK1-QOM)
        PM1=PMO
        IF(PM1.LT.PM3)PM1=PM3
        P2O=PMO
        IF(P2O.GT.8.)P2O=8.
        AOM=(AUP-1.)*O2A+1.
        MMO=AOM*OMM*EXC*(1.-(8.0001-P2O)**3./512.)
        PDO=PVO-40.
        POE=POM*PDO+1.
        IF(POE.LT.0.005)POE=0.005
        AMM=AMM+(POE-AMM)*(1.-EXP(-I/A4K))
      RETURN
      END


      SUBROUTINE AUTORG(AOM,ARM,AR1,AR2,AR3,A1K,A2K,A3K,BFN,DOB,HM,I,
     *             MO2,OSV,OVA,O2M,POA,POB,POC,POD,POK,PON,POR,POT,
     *             POV,POZ,P1O,QO2,RDO,Z,Z4,Z7)
        REAL I,MO2
        OSV=OSV+((BFN*OVA-DOB)/HM/5./BFN-OSV)/Z7
        POV=OSV*57.14
        RDO=POT**3.
        IF(RDO.LT.50.)RDO=50.
        DOB=(POV-POT)*3161./RDO
        MO2=AOM*O2M*(1.-(8.0001-P1O)**3./512.)
        QO2=QO2+(DOB-MO2)*(1.-EXP(-I/Z4))
        POT=QO2*0.00333
        P1O=POT
        IF(POT.GT.8.)P1O=8.
        POD=POV-POR

c/:
        POB=POB+(POK*POD+1.-POB)/Z
        IF(POB.LT..2)POB=.2
        AR1=AR1+(POB-AR1)*(1.-EXP(-I/A1K))
c:/
c !!! there was this line instead the block above
C        POB=POB+(POB-AR1)*(1.-EXP(-I/A1K))

        ARM=AR1*AR2*AR3
        POA=POA+(PON*POD+1.-POA)/Z
        IF(POA.LT.0.5)POA=0.5
        AR2=AR2+(POA-AR2)*(1.-EXP(-I/A2K))
        IF(POD)194,192,192
  192   POC=POZ*POD+1.
        GO TO 196
  194   POC=POZ*POD*0.33+1.
  196   IF(POC.LT.0.3)POC=0.3
        AR3=AR3+(POC-AR3)*I/A3K
      RETURN
      END

      SUBROUTINE ADH(AH,AHC,AHK,AHM,AHY,AHZ,AH7,AH8,AUP,CNA,CNB,CNR,
     *       CNZ,I,PRA,Z)
c TODO:check rutine
        REAL I
        CNB=CNA-CNR
        AHZ=0.2*PRA
        AHY=AHY+(AHZ-AHY)*0.0007*I
        AH8=AUP-1.
        IF(AH8.LT.0.)AH8=0.
        IF(CNB.LT.0.)CNB=0.
        AH=AH+(CNZ*CNB+AH8-AHZ+AHY-AH)/Z
        IF(AH.LT.0.)AH=0.
        AHC=AHC+(0.3333*AH-AHC)*(1.-EXP(-I/AHK))
        AHM=6.*(1.-EXP(-0.1808*AHC))
        IF(AHM.LT.0.3)AHM=0.3
      RETURN
      END

      SUBROUTINE MISC1(AHM,AU4,AU8,I,SR,SRK,STH,TVD,TVZ,VEC,VIC,VTW,
     *         VVE,VV6,VV7,Z )
c TODO:check rutine
        REAL I
        VV6=VV6+(SR*(VVE-0.301)-VV7-VV6)/Z
        VV7=VV7+VV6*(1.-EXP(-I/SRK))
        TVZ=(0.01*AHM-0.009)*STH
        TVD=TVD+(TVZ-TVD)/Z
        IF(TVD.LT.0.)TVD=0.
        VTW=VIC+VEC
        AU4=AU4+AU8*I
      RETURN
      END

      SUBROUTINE HEART(AUR,DHM,HMD,HR,I,PA,PMC,PMP,PMS,POT,PRA,QAO,
     *           QLO,RTP,SVO,VAE,VLE,VPE,VRE,VVE)
c TODO:check rutine
        REAL I
        DHM=(POT-6.)*0.0025
        HMD=HMD+DHM*I
        IF(HMD.GT.1.)HMD=1.
        PMC=(VAE+VVE+VRE+VPE+VLE)/0.11
        PMS=(VAE+VVE+VRE)/0.09375
        PMP=(VPE+VLE)/0.01625
        HR=(32.+40.*AUR+PRA*2.)*((HMD-1.)*0.5+1.)
        RTP=(PA-PRA)/QAO
        SVO=QLO/HR
      RETURN
      END


      SUBROUTINE CAPMBD(BFN,CFC,CPI,CPP,DFP,I,IFP,PC,PCD,PIF,PLD,PPC,
     *              PRP,PTC,PTS,PTT,PVG,PVS,RVS,TVD,VG,VID,VIF,VP,
     *              VPD,VTC,VTD,VTL,VTS,VUD,Z,Z1,FUN6)
c TODO:check rutine
        REAL I,IFP
  130   PTT=(VTS/12.)**2
        VIF=VTS-VG
        CALL FUNCTN(VIF,PTS,FUN6)
        PIF=PTT-PTS
        CPI=IFP/VIF
        PTC=0.25*CPI
        CPP=PRP/VP
        PPC=0.4*CPP
        PVG=RVS*1.79*BFN
        PC=PVG+PVS
        PCD=PC+PTC-PPC-PIF
        VTC=VTC+(CFC*PCD-VTC)/Z
        PLD=7.8+PIF-PTT
        VTL=VTL+(0.004*PLD-VTL)/Z
        IF(VTL.LT.0.)VTL=0.
        VTD=VTC-VTL-VID
        VTS=VTS+VTD*I
        VPD=VPD+(TVD-VTC+VTL-VUD-DFP-VPD)/Z1
      RETURN
      END

      SUBROUTINE PULMON(CPF,CPP,CPN,DFP,I,PCP,PFI,PLA,PLF,POS,PPA,PPC,
     *              PPD,PPI,PPN,PPO,PPR,VP,VPD,VPF,Z,Z3)
c TODO:check rutine
        REAL I
        VP=VP+(VPD*I)/Z3
  200   PCP=0.45*PPA+0.55*PLA
        PPI=2.-0.150/VPF
        CPN=PPR/VPF
        POS=CPN*0.4
        PLF=(PPI+11.)*0.0003
        PPO=PLF*CPN
        PPN=(CPP-CPN)*0.000225
        PPD=PPD+(PPN-PPO-PPD)/Z
        IF(PPR+PPD*I-0.025.LT.0.)PPD=(0.025-PPR)/I
        PFI=(PCP-PPI+POS-PPC)*CPF
        DFP=DFP+(PFI-PLF-DFP)/Z
        IF(VPF+DFP*I-0.001.LT.0.)DFP=(0.001-VPF)/I
        VPF=VPF+DFP*I
        PPR=PPR+PPD*I
      RETURN
      END

      SUBROUTINE MISC2(HPL,HPR,HSL,HSR,I,PA,PPA,POT,STH,Z10,Z11,Z13)
c TODO:check rutine
        REAL I
        HPL=HPL+(((PA/100./HSL)**Z13)-HPL)*I/57600.
        HPR=HPR+(((PPA/15./HSR)**Z13)-HPR)*I/57600.
c second right parenthesis was missing
        STH=(Z10-POT)*Z11
        IF(STH.LT.1.)STH=1.
        IF(STH.GT.8.)STH=8.
      RETURN
      END

      SUBROUTINE PROTEN(CHY,CPG,CPI,CPK,CPP,CPR,CP1,DLP,DLZ,DPC,DPI,DPL,
     *            DPO,DPY,GPD,GPR,I,IFP,LPK,PC,PCE,PGX,PRP,VG,
     *            VTL,Z,PPD)
c in word there was passed dpp in adition, ppd was in different position
c TODO:check rutine
        REAL I,IFP,LPK
  135   DPL=DPL+(VTL*CPI-DPL)/Z
        IF(PC.LT.0.)PC=0.
        DPC=DPC+(CPK*(CPP-CPI)*PC**PCE-DPC)/Z
        DPI=DPC-DPL
        DLZ=LPK*(CPR-CPP)
        IF(CPP.GT.CPR)DLZ=4.*DLZ
        DLP=DLP+(DLZ-DLP)/Z
        PRP=PRP+(DLP-DPO+DPL-DPC-PPD)*I
  141   PGX=CHY**2*0.01332*CPG+CPG
        GPD=GPD+(0.0005*(CPI-PGX)*VG-GPD)/Z
        GPR=GPR+GPD*I
        IFP=IFP+(DPI-GPD)*I
      RETURN
      END


      SUBROUTINE KIDNEY(AAR,AHM,AM,APD,ARF,AUM,CNE,CNX,CNY,GBL,GFN,GFR,
     *            GF2,GF3,GF4,GLP,I,NAE,NED,NID,NOD,NOZ,PA,PAR,PFL,
     *            PPC,RBF,REK,RFN,RR,STH,TRR,VIM,VUD,Z)
c TODO:check rutine
        REAL I,NAE,NED,NID,NOD,NOZ
  142   GF3=((GFN/0.125-1.)*GF4)+1.
        IF(GF3.GT.15.)GF3=15.
        IF(GF3.LT.0.4)GF3=0.4
        AAR=31.67*VIM*(AUM*ARF+1.-ARF)*GF3
        RR=AAR+51.66*VIM
        PAR=PA-GBL
        RFN=PAR/RR
        RBF=REK*RFN
  150   APD=AAR*RFN
        GLP=PAR-APD
        PFL=GLP-PPC-18.
        GF1=GFN
        GFN=GFN+(PFL*0.00781-GFN)*GF2/Z
        IF(ABS(GFN-GF1).GT.0.002)GO TO 142
        GFR=GFN*REK
        TRR=0.8*GFR+0.025*REK-0.001*REK/AM/AHM
        VUD=VUD+(GFR-TRR-VUD)/Z
        IF(VUD.LT.0.0002)VUD=0.0002
        NOZ=1000.*VUD/AM/(CNE/CNX+CNY)
        NOD=NOD+(NOZ-NOD)/Z
        NED=NID*STH-NOD
        NAE=NAE+NED*I
      RETURN
      END



      SUBROUTINE IONS(AM,CCD,CKE,CKI,CNA,I,KCD,KE,KED,KI,KID,KIE,
     *                KIR,KOD,NAE,REK,VEC,VIC,VID,VP,VPF,VTS,Z)
c TODO:check rutine
        REAL I,KCD,KE,KED,KI,KID,KIE,KIR,KOD,NAE
  160   VEC=VTS+VP+VPF
        CKE=KE/VEC
        KOD=(0.00042*CKE+0.001*AM*CKE)*REK
        KIR=2850.+140.*CKE
        KIE=KIR-KI
        KCD=KCD+(KIE*0.013-KCD)/Z
        KI=KI+KCD*I
        KED=KID-KCD-KOD
        KE=KE+KED*I
        CKI=KI/VIC
        CNA=NAE/VEC
        CCD=CKI-CNA
        VID=VID+(0.01*CCD-VID)/Z
        VIC=VIC+VID*I
      RETURN
      END


      SUBROUTINE GELFLD(CHY,CPG,CPI,GPR,HYL,IFP,PGC,PGH,PGP,PGR,PGX,PIF,
     *       PRM,PTC,PTS,PTT,VG,VGD,VIF,VTS,V2D,FUN6)
c VRS was passed but has is not declared and is not used
c TODO:check rutine
        REAL IFP
  140   CHY=HYL/VG
        PRM=-5.9*CHY+24.2
        PGR=0.4*CHY
        CPG=GPR/VG
        PGP=0.25*PGX
        PGC=PGP+PGR
        VIF=VTS-VG
        CALL FUNCTN(VIF,PTS,FUN6)
        PIF=PTT-PTS
        CPI=IFP/VIF
        PTC=0.25*CPI
        PGH=PIF+PTS+PRM
        VGD=V2D*(PIF+PGC-PTC-PGH)
        VG=VG+VGD
        IF(VG.LT.0.)VG=0.
        IF(0.012.LT.ABS(VGD))GO TO 140
      RETURN
      END






      SUBROUTINE FUNCTN(TH,POL,TAB)
        DIMENSION TAB(14)
        N=14
        DO 110 I=1,N,2
        IF(TAB(I)-TH) 110,120,110
  110   CONTINUE
        GO TO 140
  120   POL=TAB(I+1)
  130   RETURN
  140   NN=N-2
        DO 150 I=1,NN,2
  150   IF(TAB(I) .LT. TH .AND. TAB(i+2) .GT. TH) GO TO 160
        WRITE(6, 100) TH
  100   FORMAT(5x, '*** CURVE LIMITS EXCEEDED * ',G12.6//)
        IF(TH .LT. TAB(1)) POL=TAB(2)
        IF(TH .GT. TAB(N-1)) POL=TAB(N)
        GO TO 130
  160   POL=TAB(I+1)+(TAB(I+3)-TAB(I+1))*((TH-TAB(I))/(TAB(I+2 )-
     *  TAB(I)))
        GO TO 130
      END

      subroutine PUTOUT

        return
      end

