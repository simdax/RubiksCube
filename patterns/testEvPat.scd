// start a process

(
a=(
	mel:PAT.melody, rythme:PAT.rythme, instrument:\cheappiano,
	pat:Pbind(
		\instrument, Pfunc{~instrument},
		\degree, Plazy{~mel},
		\dur, Plazy{~rythme},
		\finish, Pfunc{arg in; ~trace.if{in.asString.inform}; 1},
	),
	dur:4, quant:1,
	play:{
		p{}
		~pat.play(quant:~quant)
	}, trace:true,
)
)
a.play
a.rythme.swing=[9,9]


