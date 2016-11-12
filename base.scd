z=(
// def....
notes:16, 
temps:8,
densite:16, // stretch equivalent, but with pattern propagation, it's not good
// matrice and interface
degree: {2.rand} ! [3,4],
setDegree: {arg s;
	s[\env].degree={2.rand} ! [3,16]},
rythme:	{[2,4].choose} ! [2,4],
setRythme:{arg s, feeling=[2,4],levels=2,nb=8;
	s[\env].rythme={feeling.choose} ! [levels,nb]
},
//_ player _ _ //
dur:inf,
forme:"aaba",
transforms:"dict.scd".loadRelative,
	//setTransforms:{arg s; s.transforms="dict.scd".loadRelative},
//simpler
)
