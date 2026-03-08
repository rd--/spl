# ordinalTransform

- _ordinalTransform([x₁ x₂ …])_

Answer the ordinal transform of the the integer sequence _x_.

The ordinal transform of
OEIS [A002260](https://oeis.org/A002260)
is
OEIS [A004736](https://oeis.org/A004736):

```
>>> [
>>> 	1
>>> 	1 2
>>> 	1 2 3
>>> 	1 2 3 4
>>> ].ordinalTransform
[
	1
	2 1
	3 2 1
	4 3 2 1
]
```

The ordinal transform of
OEIS [A003602](https://oeis.org/A003602)
is
OEIS [A001511](https://oeis.org/A001511):

```
>>> [
>>> 	1
>>> 	1 2
>>> 	1 3 2 4
>>> 	1 5 3 6 2 7 4 8
>>> ].ordinalTransform
[
	1
	2 1
	3 1 2 1
	4 1 2 1 3 1 2 1
]
```

The ordinal transform of
OEIS [A020639](https://oeis.org/A020639)
is
OEIS [A078898](https://oeis.org/A078898):

```
>>> 1:19.leastPrimeFactor
>>> .ordinalTransform
[1 1 1 2 1 3 1 4 2 5 1 6 1 7 3 8 1 9 1]
```

The ordinal transform of _φ(n)_,
OEIS [A000010](https://oeis.org/A000010),
is
OEIS [A081373](https://oeis.org/A081373):

```
>>> 1:21.eulerPhi.ordinalTransform
[1 2 1 2 1 3 1 2 2 3 1 4 1 3 1 2 1 4 1 3 2]
```

The ordinal transform of the ordinal transform of _φ(n)_,
OEIS [A303777](https://oeis.org/A303777),

```
>>> 1:21.eulerPhi
>>> .ordinalTransform
>>> .ordinalTransform
[1 1 2 2 3 1 4 3 4 2 5 1 6 3 7 5 8 2 9 4 6]
```

The ordinal transform of _φ(n)_,
OEIS [A081373](https://oeis.org/A081373):

~~~spl svg=A
1:250.eulerPhi
.ordinalTransform
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-A.svg)

The ordinal transform of the ordinal transform of _φ(n)_,
OEIS [A303777](https://oeis.org/A303777),

~~~spl svg=B
1:85.eulerPhi
.ordinalTransform
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-B.svg)

Ordinal transform of largest difference between consecutive divisors of _n_,
OEIS [A322871](https://oeis.org/A322871):

~~~spl svg=C
2:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-C.svg)

Ordinal transform of Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A322873](https://oeis.org/A322873):

~~~spl svg=D
1:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.moebiusTransform
.ordinalTransform
.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-D.svg)

Ordinal transform of edited
OEIS [A143771](https://oeis.org/A143771),
OEIS [A339914](https://oeis.org/A339914):

~~~spl svg=E
let a = 1:200.collect { :n |
	n.divisors.collect { :d |
		d + (n / d)
	}.gcd
};
a[1] := 1;
a.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-E.svg)

Ordinal transform of the largest five-smooth divisor of _n_,
OEIS [A379006](https://oeis.org/A379006):

~~~spl svg=F
1:115.collect { :n |
	[2 3 5].product { :b |
		b ^ n.integerExponent(b)
	}
}.ordinalTransform.discretePlot
~~~

![](sw/spl/Help/Image/ordinalTransform-F.svg)

Ordinal transform of ones in binary reflected Gray code of _n_,
OEIS [A286558](https://oeis.org/A286558):

~~~spl svg=G
0:200.collect { :n |
	n.grayEncode.digitCount(2, 1)
}.ordinalTransform.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-G.svg)

Ordinal transform of the largest prime factor of the _n_-th term of EKG-sequence,
OEIS [A304734](https://oeis.org/A304734):

~~~spl svg=H
250.ekgSequence
.greatestPrimeFactor
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/ordinalTransform-H.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, inverseBinomialTransform, moebiusTransform, runLengthTransform

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Ordinal_transform)
