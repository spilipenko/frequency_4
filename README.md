# Introduction

Frequency_4 is a collection of codes to compute frequency and time transfer in the Solar System with the precision up to 4-th order of $v/c$. It has been developed as a part of RSCF grant project "Exploring second-order gravitational effects and the possibility for the dark matter detection with the next generation of space-borne atomic standards of time and frequency". Codes provided in Fortran-90 and Python 3.x (requires Numpy). They represent simple but quite long algebraic expressions describing deflection of light, change of frequency and time for a photon emitted at point A and received at point B. We use Parametrized Post Newtonian (PPN) metrics for all the formulas.

# Definitions
The gravitating body is located at the origin of coordinate system. Point of photon emission A has coordinates **X0**, point where it is received, B, has coordinates **X1**. The axis of symmetry of the gravitating body and the axis of rotation coincide with $z$ coordinate axis. The metric is characterized by 10 PPN parameters: $\gamma$, $\beta$, $\xi$, $\alpha_1$, $\alpha_2$, $\alpha_3$, $\zeta_1$, $\zeta_2$, $\zeta_3$, $\zeta_4$.

# Usage

## Light deflection
Light deflection vector $\alpha_{x,y,z}$ is computed for a number of components. It is up to user to multiply them by the amplitudes, and taking into account unints of measure. An example usage is given in example.f90 file.

For every component the deflection components are given by 3 functions
```
alpha_{i}_{c}(X0, X1)
```
where {i} is x,y or z, and {c} is one of: 

* 'r1' for 1/r potentian,
* 'r2' for 1/r^2 potential,
* 'r4' for 1/r^4 potential,
* 'quadrupole' for J2 component of the quadrupole.

X0, X1 are the 3-element arrays of coordinates.

For example, to compute the actual deflection in x axis due to quadrupole only for the body of mass $M$, equatorial radius $R$ and dimensionless coefficient of second zonal harmonic $J_2$ the code is:
```
2*(1+ppn_gamma)*M*J_2*R**2 * alpha_i_quadrupole(X0,X1)
```



