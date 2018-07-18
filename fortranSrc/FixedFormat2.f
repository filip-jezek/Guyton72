      SUBROUTINE WTF2()
      REAL LVM
      dimension FUN1(14)
c      DATA FUN1(1),FUN1(2),FUN1(3),FUN1(4),FUN1(5),FUN1(6),FUN1(7), 
c     *FUN1(8),FUN1(9),FUN1(10),FUN1(11),FUN1(12)/ 
c     *0.,1.04,60.,1.025,125.,.97,160.,.88,200.,.59,240.,0./

      DATA FUN1(1),FUN1(2),FUN1(3),FUN1(4),FUN1(5),FUN1(6),FUN1(7),
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
      



      SUBROUTINE FCK (A, B)
      B = A**2
      END
