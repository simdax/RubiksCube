// start a process

b=PAT.melody

(
a=PAT.envirPoly;
a.sfdf=(dur: 1,degree:`[0,1,2], amp:0.35, appo:[1]);
)

Pbind(\type, \appo, \mtranspose, 0, \appo, 1).play


b=Pbind(\type,Plet(\scale,Pdefn(\s,[0,1,4]),\rest))
a=Pbind(\type,\note,\scale,Pget(\scale,[0,2,4],inf))
z=Pbindf(a,\mtranspose,2)

(Plambda(Ppar([b, Ppar([a,z])]))).trace.play

Pdefn(\s, [0,2,4])