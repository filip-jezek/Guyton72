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
c TODO 180 CALL MUSCLE
c TODO     CALL AUTORG
c TODO     CALL ADH
c TODO     CALL MISC1
c TODO     CALL HEART
c TODO     130 CALL CAPMBD

      I=I*1.2+T-T1
      I1=ABS(VP1/VPD/I)
      IF(I1.LT.I) I=I1
      IF(I3+T-T1.LT.I) I=I3+T-T1
      T=I+T1
      T1=T

      if(OUT.EQ.4.0) CALL PUTOUT

c TODO 200 CALL PULMON
c TODO     CALL MISC2
c TODO 135 CALL PROTEN
c TODO 142 CALL KIDNEY
c TODO 160 CALL IONS
c TODO 140 CALL GELFLD
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

c TODO: check the rutine!
  120   EXE=(8.-P2O)*EX1+(EXC-1.)*Z12
        POQ=POT
        IF(POQ.GT.8.)POQ=8.
        IF(POQ.LT.4.)POQ=4.
        PA1=PA*POQ/8.-EXE
        AUC=0.
        IF(PA1.LT.80.)AUC=0.03*(80-PA1)
        IF(PA1.LT.40.)AUC=1.2
        AUB=0.
        IF(PA1.LT.170.)AUB=0.014286*(170-PA1)
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
c TODO: check the subrutine
      DIMENSION FUN7(14)
      REAL I

c     ****************************************************************
c
c     ALDOSTERONE CONTROL BLOCK
c
c     ****************************************************************
  168   AMR=CKE/CNA/0.00352-9.
        IF(AMR.LT.0.)AMR=0.
        AM1=AM1+(ANM*AMP*AMR-AM1)/Z
        AMC=AMC+(AM1-AMC)*(1.-EXP(-I/AMT))
        AM=20.039-19.8*EXP(-0.0391*AMC)
c     ****************************************************************
c
c     ANGITENSIN CONTROL BLOCK
c
c     ****************************************************************
        CNE=152-CNA
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
c TODO: check the rutine

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

