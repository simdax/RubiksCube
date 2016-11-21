"app.scd".loadRelative

(
a=v.copy;
b=a.play;
)

a.env.envir.put(\instrument,\marimba1)

a.env.use{
	~instrument=\cheappiano;
	~densite=8;
	~rythme.value=({3.xrand}![2, 4])
}

(
a.env.use{
	~instrument=\cheappiano;
	~dur=2; ~forme="a";
	 ~transforms.value
	.use{
		~a.use
		{~cols=[2,3,2];~rows=`nil};
		~b.use
		{~cols=`nil;~rows=`nil};
	}
}
)

a=MyPPE().push;
~a=\io