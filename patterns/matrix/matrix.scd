// a matrix is a "linear" Pbind => with a fixed, short duration value which carries all informations we need.

().make{
arg melody=PAT.melody;
var rot=Harmonie.rotation;

~mel=melody;
~trans=(
	a:[\inv,[0],nil],
	b:[\inv, nil, 0],
	c:[2,[1],nil],
	// identity
	z:[{arg x; x},nil,nil]
);
~dict=MyPPE.make{
	// 
	~style=\allDom;
	//
	~transpose=0;
};
~embedInStream={arg s,in; 
	(Pbind(
		\degree, Pn(~mel, inf, \t),
		\degree, Pfunc{arg env;
			var r;
			r=rot[env.style][env.degree%7].rotate(env.transpose);
			env.degree+((..env.sst).degreeToKey([0,2,4]+r,7));
		},
		\trans, Pgate(
			Pdict(~trans,
				Pseq([\z],inf)
			).collect{arg item; 
				~mel.setMatrix(*item)
			}, inf,\t),
		\dur,1,
	) <> ~dict.asPattern).embedInStream(in)
}.inEnvir(currentEnvironment)
}


