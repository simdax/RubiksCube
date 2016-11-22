// generates a placeholder for voices
EnvironmentRedirect().envir_((
	base:PAT.matrix,
	quant:4,
	forward:{arg s, sel ... args;
		// creates 
		s.put(sel,())
	}
)).know_(true)
.dispatch_{arg k,v,s;
	// fill a envir with a new pattern
	if(k==\quant){
		s.kvdo{arg k,v;
			Pdef(k).align(v)
		}
	}{
		var res=MyPPE().make{
			~dur=0.25; ~degree=0; ~amp=0.3;
			~instrument=\cheappiano;
		}; res.putAll(v);
		a.localPut(k,res);
		/////////////////
		Pdef(\mel).source ?? {PAT.basse};
		// activate bass
		Pdef(\basse).isPlaying.not.if{Pdef(\basse).play};
		// play bass pattern if necessary
		Pdef(
			k, Pdef(\mel) <> res.asPattern
		)
		.quant_(s.quant)
		.play
	}
}

