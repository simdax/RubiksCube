// generates a placeholder for voices
EnvironmentRedirect().envir_((
	quant:4,
	forward:{arg s, sel ... args;
		// creates a
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
			~dur=0.25; ~degree=[0];
			~instrument=\cheappiano;
			~amp=0.3
		}; res.putAll(v);
		a.localPut(k,res);
		// activate bass
		Pdef(\mel).source ?? {PAT.basse};
		Pdef(\basse).isPlaying.not.if{Pdef(\basse).play};
		// play pattern
		Pdef(\mel).copy(k)
		.quant_(s.quant)
		.envir_(res.envir.as(Event))
		.play
	}
}

