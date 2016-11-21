(
s.boot;
a="../app.scd".loadRelative;
NetAddr("localhost",12000);
)
(
OSCdef(\io, {arg ... args;
	args.postln;
	b[0].mel.postln.use{
		~transforms.value.use{
			~a.use{~rows=1}
		}
	}
},\test);


~instr=[
	\cheappiano,
	\sos_bell,
	\PMCrotale,
	\marimba1,
	\plucking,
	\harpsichord1
];
b=();
~instr.collect({|x|
	var bob, player;
	bob=a.copy; player=bob.play;
	bob[\env].envir.put(\instrument,x.postln);
	//	b.put(x, (pl:player,mel:bob[\env]))
});
b
)

