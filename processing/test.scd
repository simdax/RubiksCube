(
NetAddr("localhost",12000);
OSCdef(\io, {arg ... args; args.postln},\test);

a="../app.scd".loadRelative;
~instr=[
	\cheappiano,
	\sos_bell,
	\PMCrotale,
	\marimba1,
	\plucking,
	\harpsichord1
];
b=();
b.put(\mels,
	~instr.collect({|x|
		var bob, player;
		 bob=a.copy; player=bob.play;
		bob[\env].synthDef_(x);
		player
	})
);
b
)

