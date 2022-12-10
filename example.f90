program example
use freq_4
implicit real*8 (a-z)
dimension :: X0(3), X1(3)

! general constants
c=299792458d2
mu = 1.32712440018d26/c**2
R = 700000d5
J2 = 1.6d-7
au = 150d11
to_arcsec = 206265
phi_r4 = 4.195d30

! PPN parameters
ppn_gamma = 1
ppn_beta = 1


X0(1) = 10*au
X0(2) = 0
X0(3) = 0

X1(1) = -10*au
X1(2) = 2*R
x1(3) = 0

print*,'Light deflection'

angle_r1 = (1+ppn_gamma)*mu*dsqrt(alpha_x_r1(X0,X1)**2 + alpha_y_r1(X0,X1)**2 + alpha_z_r1(X0,X1)**2)

print*,'Due to 1/r term: ',angle_r1*to_arcsec, ' arcsec'

angle_r2 = mu**2*dsqrt(alpha_x_r2(X0,X1)**2 + alpha_y_r2(X0,X1)**2 + alpha_z_r2(X0,X1)**2)

print*,'Due to 1/r^2 term: ',angle_r2*to_arcsec, ' arcsec'

angle_r4 = phi_r4*dsqrt(alpha_x_r4(X0,X1)**2 + alpha_y_r4(X0,X1)**2 + alpha_z_r4(X0,X1)**2)

print*,'Due to 1/r^4 term: ',angle_r4*to_arcsec, ' arcsec'

angle_quadrupole = J2*(1+ppn_gamma)*mu*R**2*dsqrt(alpha_x_quadrupole(X0,X1)**2 + alpha_y_quadrupole(X0,X1)**2 + &
 alpha_z_quadrupole(X0,X1)**2)

print*,'Due to J2 term: ',angle_quadrupole*to_arcsec, ' arcsec'

end program example
