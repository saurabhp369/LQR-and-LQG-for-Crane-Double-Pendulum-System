#!/usr/bin/env python
from sympy import *
import numpy as np
import math
from pprint import *

M, m1, m2, theta_1, theta_2, l1, l2, g, F, theta_1_dot, theta_2_dot, x_dot = symbols('M, m1, m2, theta_1, theta_2, l1, l2, g, F, theta_1_dot, theta_2_dot, x_dot')
m1=m2
l1=l2
x_values = {"x_dot": 0, "theta_1": 0, "theta_1_dot": 0, "theta_2": 0,"theta_2_dot": 0}
u_values = {"F": 0}


x_ddot = (1.0/(M+m1*sin(theta_1)*sin(theta_1)+m2*sin(theta_2)*sin(theta_2)))*(F - m1*g*sin(theta_1)*cos(theta_1)
- m2*g*sin(theta_2)*cos(theta_2) - m1*l1*sin(theta_1)*theta_1_dot*theta_1_dot - m2*l2*sin(theta_2)*theta_2_dot*theta_2_dot)

theta_1_ddot = (1/l1)*(x_ddot*cos(theta_1) - g*sin(theta_1))

theta_2_ddot = (1/l2)*(x_ddot*cos(theta_2) - g*sin(theta_2))

f1 = x_ddot
f3 = theta_1_ddot
f5 = theta_2_ddot

df1_dth1 = f1.diff(theta_1)
df1_dth1_dot = f1.diff(theta_1_dot)
df1_dth2 = f1.diff(theta_2)
df1_dth2_dot = f1.diff(theta_2_dot)

df1_dth1 = df1_dth1.subs(x_values)
df1_dth1 = df1_dth1.subs(u_values)
df1_dth1_dot = df1_dth1_dot.subs(x_values)
df1_dth1_dot = df1_dth1_dot.subs(u_values)
df1_dth2 = df1_dth2.subs(x_values)
df1_dth2 = df1_dth2.subs(u_values)
df1_dth2_dot = df1_dth2_dot.subs(x_values)
df1_dth2_dot = df1_dth2_dot.subs(u_values)

df3_dth1 = f3.diff(theta_1)
df3_dth1_dot = f3.diff(theta_1_dot)
df3_dth2 = f3.diff(theta_2)
df3_dth2_dot = f3.diff(theta_2_dot)

df3_dth1 = df3_dth1.subs(x_values)
df3_dth1 = df3_dth1.subs(u_values)
df3_dth1_dot = df3_dth1_dot.subs(x_values)
df3_dth1_dot = df3_dth1_dot.subs(u_values)
df3_dth2 = df3_dth2.subs(x_values)
df3_dth2 = df3_dth2.subs(u_values)
df3_dth2_dot = df3_dth2_dot.subs(x_values)
df3_dth2_dot = df3_dth2_dot.subs(u_values)

df5_dth1 = f5.diff(theta_1)
df5_dth1_dot = f5.diff(theta_1_dot)
df5_dth2 = f5.diff(theta_2)
df5_dth2_dot = f5.diff(theta_2_dot)

df5_dth1 = df5_dth1.subs(x_values)
df5_dth1 = df5_dth1.subs(u_values)
df5_dth1_dot = df5_dth1_dot.subs(x_values)
df5_dth1_dot = df5_dth1_dot.subs(u_values)
df5_dth2 = df5_dth2.subs(x_values)
df5_dth2 = df5_dth2.subs(u_values)
df5_dth2_dot = df5_dth2_dot.subs(x_values)
df5_dth2_dot = df5_dth2_dot.subs(u_values)

df1_dF = f1.diff(F)
df3_dF = f3.diff(F)
df5_dF = f5.diff(F)

df1_dF = df1_dF.subs(x_values)
df1_dF = df1_dF.subs(u_values)
df3_dF = df3_dF.subs(x_values)
df3_dF = df3_dF.subs(u_values)
df5_dF = df5_dF.subs(x_values)
df5_dF = df5_dF.subs(u_values)

A2 = Matrix([[0,1,0,0,0,0],
            [0, 0, df1_dth1, df1_dth1_dot, df1_dth2, df1_dth2_dot],
            [0,0,0,1,0,0],
            [0,0,df3_dth1, df3_dth1_dot, df3_dth2, df3_dth2_dot],
            [0,0,0,0,0,1],
            [0,0,df5_dth1, df5_dth1_dot, df5_dth2, df5_dth2_dot]])
B2 = Matrix([[0],[df1_dF],[0],[df3_dF],[0],[df5_dF]])
# r2_matrix = B2
# r2_matrix = r2_matrix.row_join(A2*B2)
# r2_matrix = r2_matrix.row_join(A2*A2*B2)
# r2_matrix = r2_matrix.row_join(A2*A2*A2*B2)
# r2_matrix = r2_matrix.row_join(A2*A2*A2*A2*B2)
# r2_matrix = r2_matrix.row_join(A2*A2*A2*A2*A2*B2)

