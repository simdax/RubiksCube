a=PAT.envirPoly
b=PAT.melody

b.class

~z
a.joe=(dur:[1],degree:0)
a.bob=(degree:[0,1,2,3,2,4,3,2,1])

z=MyPPE.make{
	~degree=b
}

z.asPattern.trace.play