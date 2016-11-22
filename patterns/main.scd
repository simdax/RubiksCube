// start a process
"settings.scd".loadRelative

b=PAT.melody

// simple example
(
a=PAT.envirPoly;
a.io=(appo:[0], dur:[0.5]);
a.bob=a.io.envir;
a.bob.mtranspose=[1,2,1];
a.bob.appo=0;
a.acc=(appo:0,octave:4,instrument:\cheappiano,
	degree:[0,[0,2],[2,4]], dur:1,
	amp:0.1
)
)


(
SFZProxy.clearAll;
b=PAT.envirPoly;
z={SFZProxy()}!3;
SFZProxy.gui;
b.o=(amp:1, instrument:\sfz_1005)
)



