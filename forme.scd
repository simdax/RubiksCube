a="dict.scd".loadRelative.deepCollect(2,{arg x; x.iter.repeat});
b="ababbbba".as(Array); c=4;

(b+++c).pseq.collect({|x|
var k,time; #k,time=x; k=k.asSymbol;
(cols:a[k].cols.next,rows:a[k].rows.next,dur:time)
}).iter.all

