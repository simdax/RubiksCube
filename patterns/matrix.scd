{
	arg rythme=RYTHME.object, melody=PAT.melody;
	var a=rythme.deepCopy, b=melody.deepCopy;
	var rot=Harmonie.rotation;
	Pbind(
		\instrument, \plucking,
		\style, \classique,
		\amp, Pkey(\amp)*Pwhite(0.1,0.3),
		\degree, Pn(b, inf, \prout),
		\mtranspose, Pstep(Pseed(0,Prand((..5),4)),4),

		\scale, Scale.at(\major),
		\degree, Pfunc{arg env;
			var r=rot[env.style][env.mtranspose];
			env.degree+([0,1,2].degreeToKey([0,2,4]+r,7));
		},
		\octave,4,
		\trans, Pgate(
			Pdict((
				a:[\inv,[0],nil],
				b:[\inv, nil, 0],
				c:[2,[1],nil]
			),
				Pseq([\a, \c, \b, \a],inf)
			).collect{arg item; 
				b.setMatrix(*item)
			}, inf,\prout),
		//	\stretch, 0.5,
		\dur,1,//Pn(a),
	)
}