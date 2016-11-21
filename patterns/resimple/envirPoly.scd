// generates a placeholder for voices

(
var a=EnvironmentRedirect().know_(true)
.dispatch_{arg k,v;
	var res=MyPPE().make{~dur=0.15; ~degree=[0];
		~instrument=\cheappiano;
		~amp=0.3
	}; res.putAll(v);
	a.localPut(k,res);
	Pdef(\mel).copy(k)
	.envir_(res.envir.as(Event))
	.play
};
a
)

