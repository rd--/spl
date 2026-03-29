# isFundamentalDiscriminant

- _isFundamentalDiscriminant(n)_

Answer `true` if the integer _n_ is a fundamental discriminant.

Positive fundamental discriminants,
OEIS [A003658](https://oeis.org/A003658):

```
>>> 1:65.select(
>>> 	isFundamentalDiscriminant:/1
>>> )
[
	 5  8 12 13 17 21 24 28 29 33
	37 40 41 44 53 56 57 60 61 65
]
```

Negative fundamental discriminants,
negated,
OEIS [A003658](https://oeis.org/A003658):

```
>>> 1:95.-.select(
>>> 	isFundamentalDiscriminant:/1
>>> ).-
[
	3 4 7 8 11 15 19 20 23 24
	31 35 39 40 43 47 51 52 55 56
	59 67 68 71 79 83 84 87 88 91
	95
]
```

Positive fundamental discriminants,
OEIS [A003658](https://oeis.org/A003658):

~~~spl svg=A oeis=A003658
1:200.select(
	isFundamentalDiscriminant:/1
).discretePlot
~~~

![](Help/Image/isFundamentalDiscriminant-A.svg)

Negative fundamental discriminants,
negated,
OEIS [A003657](https://oeis.org/A003657):

~~~spl svg=B oeis=A003657
1:200.-.select(
	isFundamentalDiscriminant:/1
).-.discretePlot
~~~

![](Help/Image/isFundamentalDiscriminant-B.svg)

* * *

See also: isSquareFree

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FundamentalDiscriminant.html)
