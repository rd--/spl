# catalanExpansion

- _catalanExpansion(n)_

Answer the Catalan expansion of the integer _n_,
giving the representation of _n_ in the mixed radix base of Catalan numbers.

Catalan expansions of integers,
the decimal expansions of
OEIS [A014418](https://oeis.org/A014418):

```
>>> 0:42.collect(
>>> 	catalanExpansion:/1
>>> )
[
	;
	1;
	1 0;
	1 1;
	2 0;
	1 0 0;
	1 0 1;
	1 1 0;
	1 1 1;
	1 2 0;
	2 0 0;
	2 0 1;
	2 1 0;
	2 1 1;
	1 0 0 0;
	1 0 0 1;
	1 0 1 0;
	1 0 1 1;
	1 0 2 0;
	1 1 0 0;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1;
	1 1 2 0;
	1 2 0 0;
	1 2 0 1;
	1 2 1 0;
	1 2 1 1;
	2 0 0 0;
	2 0 0 1;
	2 0 1 0;
	2 0 1 1;
	2 0 2 0;
	2 1 0 0;
	2 1 0 1;
	2 1 1 0;
	2 1 1 1;
	2 1 2 0;
	2 2 0 0;
	2 2 0 1;
	2 2 1 0;
	2 2 1 1;
	1 0 0 0 0
]
```

Catalan expansions of integers,
the decimal expansions of
OEIS [A014418](https://oeis.org/A014418):

~~~spl svg=A oeis=A014418 variant
0:23.collect(
	catalanExpansion:/1
).++.stepPlot
~~~

![](sw/spl/Help/Image/catalanExpansion-A.svg)

Catalan expansions of integers,
read as decimal integers,
OEIS [A014418](https://oeis.org/A014418):

~~~spl svg=B oeis=A014418
0:124.collect { :n |
	n.catalanExpansion
	.fromDigits
}.stepPlot
~~~

![](sw/spl/Help/Image/catalanExpansion-B.svg)

* * *

See also: catalanIndex, catalanNumber

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A014418)
