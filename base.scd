z=(
// def....
densite:16, // stretch equivalent, but with pattern propagation, it's not good
// matrice and interface
degree: {2.rand} ! [3,4],
rythme:	{[2,4].choose} ! [2,4],
//_ player _ _ //
dur:inf,
forme:"aaba",
transforms:"dict.scd".loadRelative,
	//setTransforms:{arg s; s.transforms="dict.scd".loadRelative},
//simpler
)
