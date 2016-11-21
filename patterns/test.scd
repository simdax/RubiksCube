// take a r and m
(
s.boot;
a=RYTHME.object;
b=PAT.melody;
)

// start a process
Pdef(\tet,
	Pbind(
		\instrument, \plucking,
		\amp, Pwhite(0.1,0.2)+0.1,
		\degree, Pn(b, inf, \prout),
		\mtranspose, Pstep(Pseed(0,Prand((..5),4)),4),
		\style, \classique,
		\scale, Scale.at(\major),
		\degree, Pfunc{arg env;
			var rot=Harmonie.rotation[env.style][env.mtranspose];
			env.degree+([0,1,2].degreeToKey([0,2,4]+rot,7));
		},
		\octave,4,
		\trans, Pgate(
			Pdict((
				a:[\inv,[0],nil],
				b:[\inv, nil, 0],
				c:[2,[1],nil]
			),
				Pseq([\a, \c, \b, \a],inf)
			).collect({arg item; 
				b.setMatrix(*item)
			})
			, inf,\prout),
		\stretch, 0.5,
		\dur,Pn(a),
	)
)

Pdef(\tet).play
// modify them live
a.swing=[9,8]
(
a.use{
	~args=[[3,2], [[1,1]], [[[1,2]]]];
	~swing=[1,2];
}
)
