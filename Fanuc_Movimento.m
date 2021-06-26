clear all

L(1) = Link([0 0 0.15 -pi/2 0]);
L(2) = Link([0 0 0.7 pi 0]);
L(3) = Link([0 0 0.1 -pi/2 0]);
L(4) = Link([0 -0.96 0 pi/2 0]);
L(5) = Link([0 0 0 pi/2 0]);
L(6) = Link([0 -0.1 0 0 0]);
%##########################################################
%Pose 0; At MASTERING position;
%##########################################################

Rob=SerialLink(L, 'name', 'Fanuc AM120iB/10L');

qf = ([-pi/2 0 pi/4 -pi/2 pi -pi/2]);
Tf =Rob.fkine(qf);


q0 =[-pi/2 0 pi/2 pi/4 pi -pi/2];
q =Rob.ikine(Tf, q0, 'mask',[1 1 1 1 1 1]);

t = 0:0.15:20;
Q= jtraj(q0, qf, t);
Tr = fkine(Rob,Q);

for i = 1:1:length(t)
    T = Tr(i);
    trs = transl(T);
    xx (i)=trs(1);
    yy (i)=trs(2);
    zz (i)=trs(3);
end


hold on
plot (Rob,Q,'trail',{'r','LineWidth', 2});



