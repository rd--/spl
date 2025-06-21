# warpingMatrices

- _warpingMatrices(x, y, w, f:/2)_

Answer the traceback and cost matrices between sequences _x_ and _y_.
In the traceback matrix a one indicates a match, two an insertion and three a deletion.

```
>>> let x = [0 2 0 1 0 0];
>>> let y = [0 0 0.5 2 0 1 0];
>>> let [t, c] = x.warpingMatrices(y);
>>> (t, c)
(
	[
		1 3 3 3 3 3 3;
		2 1 1 1 3 1 1;
		2 1 2 2 1 3 3;
		2 1 1 1 2 1 3;
		2 1 2 1 2 2 1;
		2 1 1 1 2 1 2
	],
	[
		0 0 0.5 2.5 2.5 3.5 3.5;
		2 2 1.5 0.5 2.5 3.5 5.5;
		2 2 2 2.5 0.5 1.5 1.5;
		3 3 2.5 3 1.5 0.5 1.5;
		3 3 3 4.5 1.5 1.5 0.5;
		3 3 3.5 5 1.5 2.5 0.5
	]
)
```

Plot cost matrix for 6- and 7- vectors::

~~~spl svg=A
let x = [0 2 0 1 0 0];
let y = [0 0 0.5 2 0 1 0];
let [t, c] = x.warpingMatrices(y);
c.matrixPlot
~~~

![](sw/spl/Help/Image/warpingMatrices-A.svg)

Plot cost matrix for 11- and 13- vectors:

~~~spl svg=B
let x = [0 0 1 1 0 0 -1 0 0 0 0];
let y = [0 0 0 0 2 2 0 0 0 -1 -0.5 0 0];
let [t, c] = x.warpingMatrices(y);
c.matrixPlot
~~~

![](sw/spl/Help/Image/warpingMatrices-B.svg)

* * *

See also: warpingDistance, warpingCorrespondence, warpingPlot
