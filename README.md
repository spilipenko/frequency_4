# Introduction

Frequency_4 is a collection of codes to compute frequency and time transfer in the Solar System with the precision up to 4-th order of $v/c$. It has been developed as a part of RSCF grant project "Exploring second-order gravitational effects and the possibility for the dark matter detection with the next generation of space-borne atomic standards of time and frequency". Codes provided in Fortran-90 and Python 3.x (requires Numpy). They represent simple but quite long algebraic expressions describing deflection of light, change of frequency and time for a photon emitted at point A and received at point B. We use Parametrized Post Newtonian (PPN) metrics for all the formulas.

# Definitions
The gravitating body is located at the origin of coordinate system. Point of photon emission A has coordinates **X0**, point where it is received, B, has coordinates **X1**. The axis of symmetry of the gravitating body and the axis of rotation coincide with $z$ coordinate axis. The system of units where $c=1$, $G=1$ is used in the code. The metric is characterized by 10 PPN parameters: $\gamma$, $\beta$, $\xi$, $\alpha_1$, $\alpha_2$, $\alpha_3$, $\zeta_1$, $\zeta_2$, $\zeta_3$, $\zeta_4$

# Light deflection

## Quadrupole potential
Light deflection by quadrupole potential in three coordinates x,y,z is given by functions
```
alpha_x_quadrupole(X0,X1), alpha_y_quadrupole(X0,X1), alpha_z_quadrupole(X0,X1)
```
The actual deflection for the body of mass $M$, equatorial radius $R$ and dimensionless coefficient of second zonal harmonic $J_2$ is
```
alpha_i = 2(1+\amma) M J_2 R**2 alpha_i_quadrupole(X0,X1)
```

