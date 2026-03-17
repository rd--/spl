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

~~~spl svg=A oeis=A081373
1:250.eulerPhi
.ordinalTransform
.log
.scatterPlot
~~~

![](Help/Image/ordinalTransform-A.svg)

The ordinal transform of the ordinal transform of _φ(n)_,
OEIS [A303777](https://oeis.org/A303777):

~~~spl svg=B oeis=A303777
1:85.eulerPhi
.ordinalTransform
.ordinalTransform
.discretePlot
~~~

![](Help/Image/ordinalTransform-B.svg)

Ordinal transform of largest difference between consecutive divisors of _n_,
OEIS [A322871](https://oeis.org/A322871):

~~~spl svg=C oeis=A322871
2:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.ordinalTransform.discretePlot
~~~

![](Help/Image/ordinalTransform-C.svg)

Ordinal transform of Moebius transform of largest difference between consecutive divisors of _n_,
OEIS [A322873](https://oeis.org/A322873):

~~~spl svg=D oeis=A322873
1:85.collect { :n |
	n - (n / n.leastPrimeFactor)
}.moebiusTransform
.ordinalTransform
.discretePlot
~~~

![](Help/Image/ordinalTransform-D.svg)

Ordinal transform of edited
OEIS [A143771](https://oeis.org/A143771),
OEIS [A339914](https://oeis.org/A339914):

~~~spl svg=E oeis=A339914
let a = 1:200.collect { :n |
	n.divisors.collect { :d |
		d + (n / d)
	}.gcd
};
a[1] := 1;
a.ordinalTransform.scatterPlot
~~~

![](Help/Image/ordinalTransform-E.svg)

Ordinal transform of the largest five-smooth divisor of _n_,
OEIS [A379006](https://oeis.org/A379006):

~~~spl svg=F oeis=A379006
1:115.collect { :n |
	[2 3 5].product { :b |
		b ^ n.integerExponent(b)
	}
}.ordinalTransform.discretePlot
~~~

![](Help/Image/ordinalTransform-F.svg)

Ordinal transform of ones in binary reflected Gray code of _n_,
OEIS [A286558](https://oeis.org/A286558):

~~~spl svg=G oeis=A286558
0:200.collect { :n |
	n.grayEncode.digitCount(2, 1)
}.ordinalTransform.scatterPlot
~~~

![](Help/Image/ordinalTransform-G.svg)

Ordinal transform of the largest prime factor of the _n_-th term of EKG-sequence,
OEIS [A304734](https://oeis.org/A304734):

~~~spl svg=H oeis=A304734
250.ekgSequence
.greatestPrimeFactor
.ordinalTransform
.scatterPlot
~~~

![](Help/Image/ordinalTransform-H.svg)

Ordinal transform of
OEIS [A306246](https://oeis.org/A306246),
OEIS [A306251](https://oeis.org/A306251):

~~~spl svg=I oeis=A306251
'A306246'.oeisTerms(250)
.ordinalTransform
.scatterPlot
~~~

![](Help/Image/ordinalTransform-I.svg)

Ordinal transform of Moebius transform of _φ(n)_,
OEIS [A322874](https://oeis.org/A322874):

~~~spl svg=J oeis=A322874
1:85.eulerPhi
.moebiusTransform
.ordinalTransform
.discretePlot
~~~

![](Help/Image/ordinalTransform-J.svg)

Ordinal transform of Kempner function,
OEIS [A345934](https://oeis.org/A345934):

~~~spl svg=K oeis=A345934
1:250.kempnerFunction
.ordinalTransform
.scatterPlot
~~~

![](Help/Image/ordinalTransform-K.svg)

Ordinal transform of _τ(n)_,
OEIS [A067004](http://oeis.org/A067004):

~~~spl svg=L oeis=A067004
0.divisorSigma(1:250)
.ordinalTransform
.scatterPlot
~~~

![](Help/Image/ordinalTransform-L.svg)

Ordinal transform of the arithmetic derivative of _n_,
OEIS [A263111](https://oeis.org/A263111):

~~~spl svg=M oeis=A263111
0:85.arithmeticDerivative
.ordinalTransform
.discretePlot
~~~

![](Help/Image/ordinalTransform-M.svg)

Ordinal transform of the sums of the unique strict partition of _n_ with π encoding,
OEIS [A266476](https://oeis.org/A266476):

~~~spl svg=N oeis=A266476
1:250.collect { :n |
	let l = n.primeFactors.primePi;
	let k = l.size;
	(l + 1:k - 1).sum
}.ordinalTransform.scatterPlot
~~~

![](Help/Image/ordinalTransform-N.svg)

Ordinal transform of maximum divisor of _n_,
OEIS [A286477](https://oeis.org/A286477):

~~~spl svg=O oeis=A286477
1:115.collect { :n |
	n / n.leastPrimeFactor
}.ordinalTransform.discretePlot
~~~

![](Help/Image/ordinalTransform-O.svg)

Irregular table read by rows,
initially _1_,
then the ordinal transform of all of the existing terms,
OEIS [A327616](https://oeis.org/A327616):

~~~spl svg=P oeis=A327616
let a = Map { :n |
	(n = 1).if {
		[1]
	} {
		let m = n - 1;
		a[1:m].catenate.ordinalTransform
	}
};
a[1:9].catenate.scatterPlot
~~~

![](Help/Image/ordinalTransform-P.svg)

The ordinal transform of the final nonzero digits of _n!_,
OEIS [A367799](https://oeis.org/A367799):

~~~spl svg=Q oeis=A367799
let a = 0:85.!.withoutTrailingZeroes % 10;
a.ordinalTransform.scatterPlot
~~~

![](Help/Image/ordinalTransform-Q.svg)

The ordinal transform of _gcd(1+n,ψ(n))_,
OEIS [A344771](https://oeis.org/A344771):

~~~spl svg=R oeis=A344771
1:65.collect { :n |
	(1 + n).gcd(n.dedekindPsi)
}.ordinalTransform.discretePlot
~~~

![](Help/Image/ordinalTransform-R.svg)

The ordinal transform of the leading digits of _n!_,
OEIS [A368010](https://oeis.org/A368010):

~~~spl svg=S oeis=A368010
let n = 0:115.!;
(n // (10 ^ n.log10.floor))
.ordinalTransform.discretePlot
~~~

![](Help/Image/ordinalTransform-S.svg)

The ordinal transform of the binary expansion of _n_ modulo two and contracted,
OEIS [A371944](https://oeis.org/A371944):

~~~spl svg=T oeis=A371944
1:115.collect { :n |
	let b = n.binaryExpansion;
	let o = b.ordinalTransform;
	(o % 2).binaryContraction
}.discretePlot
~~~

![](Help/Image/ordinalTransform-T.svg)

The ordinal transform of the number of iterations of _φ(x)_ at _n_ needed to reach one,
OEIS [A289152](https://oeis.org/A289152):

~~~spl svg=U oeis=A289152
1:105.collect { :n |
	eulerPhi:/1
	.nestWhileList(n) { :x |
		x != 1
	}.size - 1
}.ordinalTransform.scatterPlot
~~~

![](Help/Image/ordinalTransform-U.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform, inverseBinomialTransform, moebiusTransform, runLengthTransform

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/wiki/Ordinal_transform)
