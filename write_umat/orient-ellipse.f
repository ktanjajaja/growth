c...  ------------------------------------------------------------------
      subroutine orient (T,noel,npt,layer,kspt,coords,basis,
     1 orname,nnodes,cnodes,jnnum)
c...  ------------------------------------------------------------------

      include 'aba_param.inc'

      character*80 orname
 
      dimension T(3,3),coords(3),basis(3,3),cnodes(3,nnodes)
      dimension jnnum(nnodes)
      
      real*8 AA,BB,a,b,abs_norm
      
      AA=1.2d0
      BB=1.0d0
      b = sqrt(coords(1)**2.0d0*BB**2.0d0/AA**2.0d0+coords(2)**2.0d0)
      a = AA/BB*b
      
      if ((coords(1).eq.0.0d0).and.(coords(2).eq.0.0d0)) then
		  T(1,1) = 1.0d0
		  T(2,1) = 0.0d0
		  T(3,1) = 0.0d0
		  T(1,2) = 0.0d0
		  T(2,2) = 1.0d0
		  T(3,2) = 0.0d0
		  T(1,3) = 0.0d0
		  T(2,3) = 0.0d0
		  T(3,3) = 1.0d0 
      else
      	  abs_norm = sqrt((4.0d0*coords(1)**2.0d0/a**4.0d0)+(4.0d0*coords(2)**2.0d0/b**4.0d0))
		  T(1,1) = (2.0d0*coords(2)/b**2.0d0)/abs_norm
		  T(2,1) = (-2.0d0*coords(1)/a**2.0d0)/abs_norm
		  T(3,1) = 0.0d0
      
		  T(1,2) = (2.0d0*coords(1)/a**2.0d0)/abs_norm
		  T(2,2) = (2.0d0*coords(2)/b**2.0d0)/abs_norm
		  T(3,2) = 0.0d0
      
		  T(1,3) = 0.0d0
		  T(2,3) = 0.0d0
		  T(3,3) = 1.0d0
	  end if     

      return
      end