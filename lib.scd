(
var i={arg x; x.asBoolean.not.asInt};
var j= _.inject(1, {arg a,b; a *.x b.normalizeSum});

Pdef(\slave, { arg forme,dur;
	var now=thisThread.beats;
	Pbind(
		\rows, Plazy{arg env;
			~transforms.value[forme].rows.asArray.pseq(inf)
		},
		\cols, Plazy{arg env;
			~transforms.value[forme].cols.asArray.pseq(inf)
		},
		\melodie, Pfunc{ arg env;
			var deg=~degree.value;
			try{deg.[env.rows]=deg[env.rows].collect(i)};
			try{deg.do { |x, indRow|
				env.cols.asArray.do
				{ |col| deg[indRow][col]=i.(deg[indRow][col])}
			}};
			deg
		},
		\rythme, Pfunc{~rythme.value},
		\stretch, ~densite,
		\degree, Plazy{ arg env;
			Pseq((env.melodie*[4,2,1]).sum, inf)
		},
		\dur, Plazy{ arg env;
			var res=j.(env.rythme);
			// res=res++Pfunc{
			// 	((dur-(thisThread.beats-now))/~densite)
			// 	*(~last+0.1)
			// };
			res.pseq(inf)
		},
	)
});
// dispatch the dictionary of transforms for x time
Pdef(\test,{ 
	Pspawn(
		Pbind(
			\forme, ~forme,
			\dur, ~dur,
			\method, \seq,
			\pattern, Pfunc{ arg env;
				env.dur.postln.sign.switch(
					-1, {Pdef(\slave).fin(~degree.value.maxSizeAtDepth(1)*env.dur.abs)},
					1,  {Pdef(\slave).finDur(env.dur)}
				) <> (currentEnvironment.as(Event)++env)
			},
			\delta, 0,
		)
	)
});
)



