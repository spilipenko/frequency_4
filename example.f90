program example
use freq_4
implicit real*8 (a-z)
dimension :: X0(3), X1(3), W(3)

! general constants
c=299792458d2
mu = 1.32712440018d26/c**2
R = 700000d5
J2 = 1.6d-7
au = 150d11
to_arcsec = 206265
phi_r4 = 4.195d30 ! part of Phi_W PPN potential
V_amp = 2.38e9 ! vector-potential = V_amp/r**2 * sin(theta)

! PPN parameters
ppn_gamma = 1
ppn_beta = 1
ppn_alpha_1 = 4d-5 ! constrain on PPN alpha_1
ppn_alpha_2 = 2d-9 ! constrain on PPN alpha_2


X0(1) = 10*au
X0(2) = 0
X0(3) = 0

X1(1) = -10*au
X1(2) = 2*R
x1(3) = 0

! Velocity of the Sun with respect to CMB:
W(1) = -0.00124d0
W(2) = 0.00264d0
W(3) = -0.000156d0

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

angle_V = V_amp * dsqrt(alpha_x_V(X0,X1)**2 + alpha_y_V(X0,X1)**2 + alpha_z_V(X0,X1)**2)

print*, 'Due to Sun`s rotation: ', angle_V*to_arcsec, ' arcsec'

print*, 'In case of non-zero PPN parameters alpha_1=4e-5, alpha_2=2e-9:'

angle_wU = ppn_alpha_1*mu*dsqrt(alpha_x_wU(X0,X1,w)**2 + alpha_y_wU(X0,X1,w)**2 + alpha_z_wU(X0,X1,w)**2)

print*, 'Due to alpha_1(w^2 U + w_j U): ', angle_wU*to_arcsec, ' arcsec'

angle_wV = ppn_alpha_1*V_amp* dsqrt(alpha_x_wV(X0,X1,w)**2 + alpha_y_wV(X0,X1,w)**2 + alpha_z_wV(X0,X1,w)**2)

print*, 'Due to alpha_1 w_j V^j: ', angle_wV*to_arcsec, ' arcsec'

angle_wUjk = ppn_alpha_2*mu*dsqrt(alpha_x_wUjk(X0,X1,w)**2 + alpha_y_wUjk(X0,X1,w)**2 + alpha_z_wUjk(X0,X1,w)**2)

print*, 'Due to alpha_2 w^j w^k U_jk: ', angle_wUjk*to_arcsec, ' arcsec'



end program example
