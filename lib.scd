(
var i={arg x; x.asBoolean.not.asInt};
var j= _.inject(1, {arg a,b; a *.x b.normalizeSum});

//rythme
// j.([4,[3,3,2],[[1,1],[2,1],1],1])

var k="rythme.scd".loadRelative;


Pdef(\slave, { arg forme, dur, cols, rows;
	var now=thisThread.beats;
	var deg=~degree.value.copy, copy, top=currentEnvironment; 
	Pfset({},
		Pbind(
		\melodie, Pfunc{ arg env;
			copy=deg.deepCopy;
			try{copy.[rows]=deg[rows].collect(i)};
			try{copy.do { |x, indRow|
				cols.value.asArray.do
				{ |col| copy[indRow][col]=i.(copy[indRow][col])}
			}};
			copy.postln
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
		)//.trace([\rows,\cols]),
		{  top.use{~degree.value=copy} }
	)
});
// Dispatch the dictionary of transforms for x time
Pdef(\test,{ 
	Pspawn(
		Pbind(
			\index, Pseries(),
			\forme, ~forme,
			\dur, ~dur,
			\rows, Plazy{arg env;
				~transforms.value[env.forme].rows.asArray.pseq()
			}.repeat,
			\cols, Plazy{arg env;
				~transforms.value[env.forme].cols.asArray.pseq()
			}.repeat,
			\method, \seq,
			\pattern, Pfunc{ arg env;
				env.dur.sign.switch(
					-1, {Pdef(\slave).fin(~degree.value.maxSizeAtDepth(1)*env.dur.abs)},
					1,  {Pdef(\slave).finDur(env.dur)}
				) <> (currentEnvironment.as(Event)++env)
			},
			\delta, 0,
		)//.trace(\forme)
	)
});
)



