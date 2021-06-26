a1 = 1;
a2 = 0.7;

Rob = SerialLink([
Revolute('d', 0, 'a', a1, 'alpha', 0, 'standard')
Revolute('d', 0, 'a', a2, 'alpha', 1, 'standard')
], ...
'name', 'planar 2 link');

qz = [0 0];
t=0:0.1:2;
q1_pick=[pi/2 pi/2];
q2_pick=[-pi/6 pi/4];
s1_pick = jtraj(q1_pick, q2_pick,t);
plot (Rob, s1_pick, 'trail',{'r','LineWidth', 2})


q3_pick = [0, -pi/2]
s2_pick = jtraj(q2_pick, q3_pick,t);
plot(Rob, s2_pick)


s3_return = jtraj(q3_pick, q1_pick,t)
plot(Rob, s3_return)


P = zeros (0,0)
input ('Calculate the Position')
q = Rob.getpos();

P(1) = a1*cos(q(1)) + a2*cos(q(1)+q(2));
P(2) = a1*sin(q(1)) + a2*sin(q(1)+q(2));

disp(P)