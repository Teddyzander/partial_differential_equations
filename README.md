# partial_differential_equations
Place for experimentation for understanding of PDEs. The plan here is not to create clean, efficient code, but to experiment with, and play around with, some differential equations numerically.

Little things done so far to help my intuition:


## ODEs Pendulum Swing

A small bit of code used to create a vector field of a swinging pendulum, that decays due to air resistance using

**theta''(t) = - mu * theta'(t) - (g/L) * sin(theta(t))**, where

- theta''(t) is the change in the acceleration of the pendulum as a function of time
- mu is the friction coeffecient of the entire system
- theta'(t) is the acceleration of the pendulum as a function of t
- g is acceleration due to gravity
- L is the length of the pendulum from pivot to end
- theta(t) is the angle of the pendulum from hanging straight down as a function of t

![pendulum_vector_field](pendulum_project/pendulum_vector_field.jpg?raw=true "Title")
![pendulum_examples](pendulum_project/pendulum_examples.jpg?raw=true "Title")

## One Dimensional Heat Equation

A little code for numerical analysis of the one dimensional heat equation. For the example in the code, the rod is n=100 units long, with the ends of the rod being at "ambient room temperature" always. The first half of the rod is hot, the second half is cold. The equation used to analyse each step is

**x_{i+1} = x_i + alpha/2 * (T_{i-1} - T_{i}) - (T_{i} - T_{i-1})** with i=2:(n-1), where

- x_{i} is the temperature at step i
- T_{i} is the temperature at i of the previous time step
- alpha is some constant that is dependent on the material being heated (dictates how quickly the rod can cool)

Basically, the temperature for each part of the rod is equal to the temperature at the previous time step plus the average of the temperature of the two parts surrounding it at the previous time step.

Results look like:

![1d_rod_flat](heat_equation/1d_rod_heat_space_time.jpg?raw=true "Title")
![1d_rod_3d](heat_equation/1d_rod_heat_space_time_temp.jpg?raw=true "Title")
![1d_rod_steps](heat_equation/1drod_heat_space_steps.jpg?raw=true "Title")
