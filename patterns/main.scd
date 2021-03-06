// start a process
"settings.scd".loadRelative

// simple example
(
a=PAT.envirPoly;
a.base=(amp:0.5,degree:Pn(PAT.melody),dur:Pn(RYTHME.object));
a.io=(appo:[0], dur:[0.5]);
a.jo=(dur:[0.5,1,2,0.5,0.5]/2, octave:6);
a.tch=(degree:(10..-5),dur:0.125);
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
b.o=(amp:, degree:[0,3,2,1], dur:5 , instrument:\sfz_1002);
b.do=(amp:1, dur:0.25,  instrument:\sfz_1003);
b.ot=(amp:1, appo:[1,0], degree:[2,4,3,1], dur:0.25, instrument:\sfz_1004);
)



