# oeisFunction

- _oeisFunction(s)_

Answer a unary block that will answer the _n_-th term of the OEIS sequence _s_.

Sierpiński’s triangle converted to decimal,
OEIS [A001317](http://oeis.org/A001317):

```
>>> 0:11.collect('A001317'.oeisFunction)
[1 3 5 15 17 51 85 255 257 771 1285 3855]
```

Denominators in canonical bijection from positive integers to positive rationals _≤1_,
OEIS [A038567](http://oeis.org/A038567):

```
>>> 0:21.collect(
>>> 	oeisFunction('A038567')
>>> )
[1 2 3 3 4 4 5 5 5 5 6 6 7 7 7 7 7 7 8 8 8 8]
```

Plot numerators in canonical bijection from positive integers to positive rationals,
OEIS [A020652](https://oeis.org/A020652):

~~~spl svg=A oeis=A020652
1:200.collect(
	oeisFunction('A020652')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-A.svg)

Plot denominators in canonical bijection from positive integers to positive rationals,
OEIS [A020653](https://oeis.org/A020653):

~~~spl svg=B oeis=A020653
1:200.collect(
	oeisFunction('A020653')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-B.svg)

Plot numerators in canonical bijection from positive integers to positive rationals,
OEIS [A038568](http://oeis.org/A038568):

~~~spl svg=C oeis=A038568
1:200.collect(
	oeisFunction('A038568')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-C.svg)

Plot denominators in canonical bijection from positive integers to positive rationals,
OEIS [A038569](http://oeis.org/A038569):

~~~spl svg=D oeis=A038569
1:200.collect(
	oeisFunction('A038569')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-D.svg)

A self-inverse permutation of natural numbers,
_A080300_ of _A036044_ of _A014486_ of _n_,
OEIS [A057164](https://oeis.org/A057164):

~~~spl svg=E oeis=A057164
0:197.collect(
	[
		'A014486'
		'A036044'
		'A080300'
	].oeisFunction.composeRight
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-E.svg)

_A003961(n)-2*n_,
OEIS [A252748](https://oeis.org/A252748):

~~~spl svg=F oeis=[A252748]
let n = 1:85;
let a = n.collect(
	'A003961'.oeisFunction
);
(a - (2 * n)).discretePlot
~~~

![](sw/spl/Help/Image/oeisFunction-F.svg)

* * *

See also: OeisEntry, oeisTerms

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org)
