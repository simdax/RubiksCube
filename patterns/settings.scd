(
var a={arg x; x-(x.mean)};
var b={arg x; (x.sum+a.(x))/x.sum};

PdefAllGui();
s.boot; s.makeGui;

Event.addEventType(\appo,{ arg self;
	var dur,add;
	~degree=~degree.degreeToKey(~scale?[0,2,4],7);
	~scale=Scale.at(~mode?\major);
	~appo ?? {~appo=0};
	add=Array.series(~appo.abs+1,~appo,~appo.sign.neg);
	dur=b.((~swing?[1]).wrapExtend(~appo.abs+1));
	~type=\note;
	Pbind(\degree,add.iter+~degree, \dur, dur.ns.iter*~dur)
	.play(protoEvent:currentEnvironment);
});
)

