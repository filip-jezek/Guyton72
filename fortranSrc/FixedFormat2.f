      PROGRAM WTF2
      REAL LVM
	  dimension fun1(14)
c      DATA FUN1(1),FUN1(2),FUN1(3),FUN1(4),FUN1(5),FUN1(6),FUN1(7), 
c     *FUN1(8),FUN1(9),FUN1(10),FUN1(11),FUN1(12)/ 
c     *0.,1.04,60.,1.025,125.,.97,160.,.88,200.,.59,240.,0./

      DATA FUN1(1),FUN1(2),FUN1(3), FUN1(4),FUN1(5),FUN1(6),FUN1(7),
	 *FUN1(8),FUN1(9),FUN1(10),FUN1(11),FUN1(12),FUN1(13),FUN1(14)/
     *0.,1.04,60.,1.025,125.,.97,160.,.88,200.,.59,240.,0.,240.,0./ 

c     + 0.0,1.04,60.0,l.025,125.0,0.97,160.0,0.88,200.0,0.59,240.0,240.0
c     + ,0.0, 0.0/     
      AHK =   7.00000
c      AH8 =   0.000000
      ALO =   1.00000
c      AMT =   60.0000
c Hello worslk!
      
      PRINT *
      PRINT *,'AHK JE ', AHK
      PRINT *, SIZE(FUN1)
      PA2 = 100.0000000
      LVM = 1.00
      PRINT *, 'co to totot', PA2
      PRINT *, 'a ted', LVM
      A = 3.2
      B = 1.0
      CALL FCK(A, B)
      print *, 'aand the B is ', B
      CALL FUNCTN(PA2,LVM,FUN1)
      PRINT *, 'A je to'
      print *, LVM
      END
      
      SUBROUTINE FUNCTN(TH,POL,TAB)
      DIMENSION TAB(14)
      N=14
      
      DO 110 I=1,N,2
      print *, 'TAB(I) ', TAB(I)
      print *, 'TH ', TH
      IF(TAB(I)-TH) 110,120,110
  110 CONTINUE
      GO TO 140
  120 POL=TAB(I+1)
  130 RETURN
  140 NN=N-2
      DO 150 I=1,NN,2
  150 IF(TAB(I) .LT. TH .AND. TAB(i+2) .GT. TH) GO TO 160
      WRITE(6, 100) TH
  100 FORMAT(5x, '*** CURVE LIMITS EXCEEDED * ',G12.6//)
      IF(TH .LT. TAB(1)) POL=TAB(2)
      IF(TH .GT. TAB(N-i)) POL=TAB(N)
      GO TO 130
  160 POL=TAB(I+1)+(TAB(I+3)-TAB(I+1))*((TH-TAB(I))/(TAB(I+2 )-TAB(I)))
      GO TO 130
      END     


      SUBROUTINE FCK (A, B)
      B = A**2
      END