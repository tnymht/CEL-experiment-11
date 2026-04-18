# CEL-experiment-11
Objective: To numerically obtain the governing PDE of any physical system and solve it numerically.


## Numerical Solution of 2D Heat Conduction (PDE)

In this project, I implemented a numerical solution of the 2D transient heat conduction equation using MATLAB. The objective was to understand how partial differential equations (PDEs) governing physical systems can be discretized and solved using numerical methods.

The problem considers a square metal plate (0.75 m × 0.75 m) where one edge is maintained at 100°C and the remaining edges are at 0°C. The temperature distribution evolves over time according to the heat conduction equation.

The governing equation is:

```cpp
dT/dt = k * (d2T/dx2 + d2T/dy2)
```

Using the explicit finite difference method, the discretized form becomes:

```cpp
T_new(i,j) = T(i,j) + (k*dt/(h*h)) * (T(i+1,j) + T(i-1,j) + T(i,j+1) + T(i,j-1) - 4*T(i,j))
```

where `h` is the spatial step size and `dt` is the time step.

The method works by dividing the plate into a grid and updating the temperature at each node using values from neighboring points. The process is repeated iteratively until the solution converges.

During implementation, I applied boundary conditions such that one side of the plate remains at a constant high temperature while the others are kept at zero. The solution was updated at each time step until the error between successive iterations became very small.

The results showed how heat gradually diffuses across the plate from the heated boundary to the cooler regions. The temperature distribution becomes smoother over time and eventually reaches a steady state.

From this experiment, I learned that numerical methods like the explicit finite difference method are effective for solving PDEs but require careful selection of time step and grid size to ensure stability and accuracy.

In conclusion, the explicit method provides a simple approach to solve heat conduction problems, but it is conditionally stable and sensitive to discretization parameters. Proper choice of step sizes and boundary conditions is essential for reliable results.
