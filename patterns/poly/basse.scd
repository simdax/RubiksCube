
(
var a={arg x; x-(x.mean)};
var b={arg x; (x.sum+a.(x))/x.sum};

s.boot; s.makeGui;

Event.addEventType(\appo,{ arg self;
	var dur,add;
	~degree=~degree.degreeToKey(~scale?[0,2,4],7);
	~scale=Scale.at(~mode?\major);
	~appo ?? {~appo=0};
	add=Array.series(~appo.abs+1,~appo,~appo.sign.neg);
	dur=b.((~swing?[1]).wrapExtend(~appo.abs+1)); dur.postln;
	~type=\note;
	Pbind(\degree,add.iter+~degree, \dur, dur.ns.iter*~dur)
	.play(protoEvent:currentEnvironment);
	//	~type=\note; currentEnvironment.play
});
Pdef(\basse,
	Plazy{PAT.matrix}.collect({|ev| topEnvironment[\z]=ev; Rest() })
);
Pdef(\mel, 
	Pbind( 
		\type, \appo,
		\scale, Pfunc{topEnvironment[\z].degree}
	)
);
Pdef(\basse).play
)


// (
// Pdef(\basse).play;
// ~morceau=6.collect{
// 	var res=MyPPE().make{~dur=0.15; ~degree=[0];
// 		~instrument=\cheappiano;
// 		~amp=0.3};
// 	//	res.envir.put(\instrument,\cheappiano);
// 	res};
// ~morceau.do{arg a; (Pdef(\mel)<>a.envir.as(Event)).play};
// )

// ([
// (instrument:\cheappiano,   octave:5,amp:0.5),
// (instrument:\marimba1,   octave:5,amp:0.2),
// (instrument:\plucking,   octave:5,amp:0.051),

// (instrument:\kick, octave:4,amp:0.3),
// (instrument:\cheappiano, octave:3,amp:0.2),
// (instrument:\moogbass,   octave:3,amp:0.2),
// ].do { |dict, ind|
// ~morceau[ind].putAll(dict)
// };)


// ([
// (dur:Maybe(1/4),degree:[1,2,3]),
// (dur:Maybe(1/4),degree:[0]),
// (dur:Maybe(1/4),degree:`[0,1,2]),

// (dur:1/8,degree:[0,1,2,3,4,5]),
// (dur:1/2,degree:[0,2]),
// (dur:1/2,degree:[3,0]),
// ].do { |dict, ind|
// ~morceau[ind].putAll(dict)
// };)


// SynthDefPool.gui
