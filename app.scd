(
"lib.scd".loadRelative;
v=nil;
v=
"base.scd".loadRelative
.putAll(
	(
		densite:4,
		dur:2, forme:"a", last:0, repeats:inf,
		instrument:\cheappiano,
		pat:Pdef(\test),
		quant:0,
		play:{arg s; 
			var copy=s.copy;
			var bim=MyPPE();
			// "protect matrix"
			copy.degree=Ref(copy.degree);
			copy.rythme=Ref(copy.rythme);
			copy.transforms=Ref(copy.transforms);
			//copy
			copy.keysValuesDo{arg k,v;
				if([Integer,String,Float].includes(v.class))
				{bim.put(k,v)}{
					if([Ref,Symbol].includes(v.class)){
						bim.envir.put(k,v)
					}
				}
			};				
			s[\env]=bim;
			s[\env].postln.use
			{
				s.pat.envir_(s[\env])
				.fork(s.pat.clock,s.quant);
			};
		},
	);
)
)

(
a=v.copy;
b=a.play;
)
(
a.env.use{
	~densite=4;
	~dur=[2,4,-1]; ~forme="ab"
	// ~transforms.use{
	// 	~a.use
	// 	{~cols=[`nil, 1,2,3];
	// 		~rows=`nil};
	// 	~b.use
	// 	{~cols=`nil;
	// 		~rows=`nil};
	// }
}
)

