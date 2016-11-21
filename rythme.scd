(
// core Funcs
var f=(
k:{arg zzz;
	zzz.collect{arg x; if(x.isCollection){x.deepCollect(x.maxDepth-1,{arg x; x.asArray.normalizeSum})}{x}}
	.flop
	.collect(_.reduce('*'))
},
bob:{arg z; z.ns.collect(z.mean*_)},
joe:{arg s,a,b;(a * s[\bob].(b)).ns * a.sum }
);

// object
a=EnvironmentRedirect().envir_((
	// private
	f:f,
	// interface
	time:4, args:[[3,3,2],[[1,1],[1,2],1]], swing:[9,8],
	
	// embedding
	res:{arg s;
		s.f.joe(s.f[\k].(s.args),s.swing) * s.time
	},
	pp:PatternProxy(),
	embedInStream:{arg s, in; 
		s.pp.source_(s.res.flat.pseq())
		.embedInStream(in)
	},
))
.dispatch_{a.pp.source_(a.res.flat.pseq())}
)






