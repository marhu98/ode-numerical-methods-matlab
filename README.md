# Collection of numerical methods to solve ODE's written in Matlab

## **Warnign**: This repo is still messy, but all the methods do work.

This are some numerical methods I wrote for UCM numerical analysis course. ODEs may have any dimension but they must be of order 1, this is not a problem as is it well known how to turn ODEs of order n into ODEs of order 1.
All methods take a function, an interval, a starting point and a iteration number. 

## Glosary of methods:
- Elementary methods
  - Euler method: meuler.m
  - Improved Euler method (or order 2): meulermej.m
  - Modified Euler method (still of order 1): meulermod
- Runge-kutta:.m
  - Runge-kutta 3: rk3.m
  - Runge-kutta 4: rk4.m
- Linear methods:
  - Milne's method: milne.,
  - Explicit:
    - Adam-Bashford of i steps: mabi.m
    - Adam-Moulton of i steps using Adam-Bashford of j steps as a predictor: mabjami.m
- Examples
  - solexac1.m and solexac2.m solve two ODEs exactly so that the precission of the different methods can be compared
  - pendulus.m solves the simple pendulum ODE, while pendulo.m solves it and compares it with it's linealization.
  - testmet: Loads the arguments from the file datos and then solves it using the provided method. ** Provides a quick and easy way to compare different method, specially since they might behave differently when stability is an issue. **
