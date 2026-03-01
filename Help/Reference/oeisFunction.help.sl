# oeisFunction

- _oeisFunction(s)_

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

~~~spl svg=A
1:200.collect(
	oeisFunction('A020652')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-A.svg)

Plot denominators in canonical bijection from positive integers to positive rationals,
OEIS [A020653](https://oeis.org/A020653):

~~~spl svg=B
1:200.collect(
	oeisFunction('A020653')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-B.svg)

Plot numerators in canonical bijection from positive integers to positive rationals,
OEIS [A038568](http://oeis.org/A038568):

~~~spl svg=C
1:200.collect(
	oeisFunction('A038568')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-C.svg)

Plot denominators in canonical bijection from positive integers to positive rationals,
OEIS [A038569](http://oeis.org/A038569):

~~~spl svg=D
1:200.collect(
	oeisFunction('A038569')
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-D.svg)

A self-inverse permutation of natural numbers,
_A080300_ of _A036044_ of _A014486_ of _n_,
OEIS [A057164](https://oeis.org/A057164):

~~~spl svg=E
0:197.collect(
	[
		'A014486'
		'A036044'
		'A080300'
	].oeisFunction.composeRight
).scatterPlot
~~~

![](sw/spl/Help/Image/oeisFunction-E.svg)

* * *

See also: OeisEntry

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org)
