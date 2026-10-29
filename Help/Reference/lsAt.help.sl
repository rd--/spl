# lsAt

- _lsAt(list, indices)_

At each step answer _at_ of _indices_ into _list_.

Index into list of odd numbers using integer brownian motion:

~~~spl svg=A
let l = [1, 3 .. 23];
lsAt(
	l,
	lsIBrown(1, l.size, 2, 99, Sfc32(798143))
).upToEnd.linePlot
~~~

![](Help/Image/lsAt-A.svg)

* * *

See also: lsAtFold, lsAtWrap

Categories: Stream
