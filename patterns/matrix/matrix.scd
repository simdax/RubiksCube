().make{
arg rythme=RYTHME.object, melody=PAT.melody;
var a=rythme;
var rot=Harmonie.rotation;
var t=currentEnvironment;
~mel=melody;
~trans=(
	a:[\inv,[0],nil],
	b:[\inv, nil, 0],
	c:[2,[1],nil],
	z:[{arg x; x},nil,nil]
);
~dict=MyPPE.make{
	// send "t" key for transformation each mel iteration
	~degree= Pn(t[\mel], inf, \t);
	~style=\allDom;
	~seedTranspo=0; //~interT =(..5);
	~mtranspose=0; ~sst=2;
	//	~mtranspose= Pstep(Pseed(~seedTranspo,Prand((..5),4)),4);
};
~embedInStream={arg s,in; 
	(Pbind(
		\degree, Pfunc{arg env;
			var r;
			r=rot[env.style][env.degree%7].rotate(env.mtranspose);
			env.degree+((..env.sst).degreeToKey([0,2,4]+r,7));
		},
		\trans, Pgate(
			Pdict(~trans,
				Pseq([\z],inf)
			).collect{arg item; 
				~mel.setMatrix(*item)
			}, inf,\t),
		//	\stretch, 0.5,
		\dur,1,//Pn(a),
	) <> ~dict.asPattern).embedInStream(in)
}.inEnvir(currentEnvironment)
}

