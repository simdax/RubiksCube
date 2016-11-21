(
var f=(inv:{arg x; x.asBoolean.not.asInt});
var a=(
	tailleVecteur:3,nb:8,  genSeed:{2.rand},
	doMatrix:{arg s; s.use{
		~matrix=(~seed ? ~genSeed) ! [~tailleVecteur, ~nb]}
	},
	setMatrix:{arg s,val,row,col;
		if(val.class==Symbol){val=f[val]};
		s.use{ ~matrix.slicePut(val,row,col) }; s.res;
	},
	sstructure: {arg s; s.use{(2.pow(_)) ! ~tailleVecteur}},
	res:{arg s;  s.use{
		~matrix ?? {s.doMatrix};
		~list=( ~matrix * s.sstructure).sum
	}}
);
EnvironmentRedirect().envir_(a.putAll((
		// embedding
	coun:0,
	embedInStream:{arg s, in;
		s.list ?? {s.res}; s.coun=0;
		p{ var res; while{res=(s.list @ s.coun); res.notNil}
			{in=res.yield; s.coun=s.coun+1;}
		}.embedInStream(in); in
	},
)))
.dispatch_{arg k,v;
	var size=a.list.size;
	k.switch(
		\matrix, {a.res}
	);
	[\tailleVecteur,\nb,\seed].includes(k).if{
		a.res; if(a.list.size>size){a.coun=0}
	}
}
)
