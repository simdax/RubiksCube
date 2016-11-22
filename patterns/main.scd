// start a process
"settings.scd".loadRelative

b=PAT.melody

(
a=PAT.envirPoly;
a.io=(appo:[0], dur:[0.5]);
a.bob=a.io.envir;
a.bob.mtranspose=[1,2,1];
a.bob.appo=0;
a.acc=(appo:0,instrument:\cheappiano,degree:[0,[0,2],[2,4]], dur:1,
	amp:0.1
)
)

