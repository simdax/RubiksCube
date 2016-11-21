().make{
arg rythme=RYTHME.object, melody=PAT.melody;
var a=rythme.deepCopy, b=melody.deepCopy;
var rot=Harmonie.rotation;
var t=currentEnvironment;
~mel=b;
~trans=(
				a:[\inv,[0],nil],
				b:[\inv, nil, 0],
				c:[2,[1],nil]
			);
~dict=MyPPE.make{
	// send "prout" each iteration
	~degree= Pn(t[\mel], inf, \prout);
	~seedTranspo=0; //~interT=(..5);
	~style=\classique;
	~mtranspose= Pstep(Pseed(~seedTranspo,Prand((..5),4)),4);
};
~embedInStream={arg s,in; [s,in].postln;
	(Pbind(
		\instrument, \plucking,
		\amp, Pkey(\amp)*Pwhite(0.1,0.3),
		\scale, Scale.at(\major),
		\degree, Pfunc{arg env;
			var r;
			r=rot[env.style][env.mtranspose];
			env.degree+([0,1,2].degreeToKey([0,2,4]+r,7));
		},
		\trans, Pgate(
			Pdict(~trans,
				Pseq([\a, \c, \b, \a],inf)
			).collect{arg item; 
				~mel.setMatrix(*item)
			}, inf,\prout),
		//	\stretch, 0.5,
		\dur,1,//Pn(a),
	).trace <> ~dict.asPattern).embedInStream(in)
}.inEnvir(currentEnvironment)
}