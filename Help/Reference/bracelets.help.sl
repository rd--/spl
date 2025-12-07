# bracelets

- _bracelets(n, k)_

Answer all bracelets of length _n_ from the alphabet _0,1…k_.

Enumerate _6,2_ bracelets:

```
>>> bracelets(6, 2)
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 0 0 1;
	0 0 1 0 1 1;
	0 0 1 1 1 1;
	0 1 0 1 0 1;
	0 1 0 1 1 1;
	0 1 1 0 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1
]

>>> braceletCount(6, 2)
13

>>> necklaceCount(6, 2)
14
```

Matrix plot of _8,2_ bracelets:

~~~spl svg=A
bracelets(8, 2)
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/bracelets-A.svg)

Circular matrix plot of _3,3_ bracelets:

~~~spl svg=B
bracelets(3, 3)
.circularMatrixPlot
~~~

![](sw/spl/Help/Image/bracelets-B.svg)

* * *

See also: braceletCount, necklaces

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))

Further Reading: Sawada 2001
