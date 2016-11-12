(
a:(),
b:( 
	cols: [[0,1,3,4],[0,2,5],[2,3,6]],
	rows:  0 ,
)
).collect{arg dict;
	dict.parent_((cols:`nil,rows:`nil))
}