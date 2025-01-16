# LsAt

- _LsAt(list, indices)_

At each step answer _at_ of _indices_ into _list_.

Plot:

~~~spl svg=A
let l = [1, 3 .. 23];
LsAt(
	l,
	LsIBrown(1, l.size, 2, 99, Sfc32(798143))
).upToEnd.linePlot
~~~

![](sw/spl/Help/Image/LsAt-A.svg)

* * *

See also: LsAtFold, LsAtWrap

Categories: Stream
