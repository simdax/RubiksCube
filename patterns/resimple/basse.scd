
(
s.boot; s.makeGui;
Pdef(\basse,
	PAT.matrix.collect({|ev| topEnvironment[\z]=ev; Rest() })
);
Pdef(\mel, { arg degree,dur,instrument,amp;
	Pbindf( Plazy{topEnvironment[\z] ? ()}.repeat,
		\instrument, instrument,
		\amp, amp,
		\degree, PdegreeToKey(
			degree, Pkey(\degree), 7
		),
		\dur, dur * Pkey(\dur)
	) 
}
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
