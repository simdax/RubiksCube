a=LazyEnvir().make{ arg un;
	var p=un.envir.parent;
	p.put(\specs,(depart:[0,6,0,1]));
	~accord=[0,2,4]; ~depart=0; p.putAll((res:[]));
	// PRIVATE
	p.put(\go, {
		~res=nil;
		~squelette=~parcours.list.collect{ arg x;
		Harmonie.rea.res(x)
		};
		~squelette.inject([~accord],
			{arg a,b; ~res=~res.add(a.last+b)})
	}.inEnvir(un)
	);
	//gui
	p.put(\g,{ arg s,par=FlowView(),b;
		un.parcours.gui(parent:par);
		un.gui(parent:par);
		p.put(\listGuiReal,EZListView(par));
		p.put(\listGuiNotes,EZListView(par));
	});
	p.put(\parcours,Harmonie.parcoursEnv(un) );
}.know_(true)
.dispatch_({ arg k,v,s; 
	a.use{k.switch(
		//		\depart, {a.parcours}
		\bob, {}, \res, {}, {
	}
	)}
});
a.g;

a=EZListView()
a.items_([0, [9,3]].collect(_.asString))
