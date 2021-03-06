// generates multiple voices
LazyEnvir().know_(true).make{
	~env=PAT.envirPoly;
	~nbVoix=6; ~notes=8; 
	~rythme=RYTHME.object.setArgsRecursiv({3.xrand}!3,2);
	// mel
	~mel={5.rand} ! 8;
	~rotations={8.rand} ! 6;
	~res={
		~dicts=~rotations.value.collect{arg x;
			(
				degree:~mel.value.rotate(x),
				dur:~rythme.value.list.rotate(x)
			)
		};
		~dicts.collect{|dict, ind|
			~env.put(ind.asSymbol,dict)
		}
	}
}.dispatch_{ arg k,v, s;
	s.res;
}



