# sternBrocotSequence

- _sternBrocotSequence(n)_

Answer the first _n_ entries of the Stern-Brocot sequence,
also called Stern’s diatomic series,
also called _fusc_.

The first few terms of Stern’s diatomic series,
OEIS [A002487](https://oeis.org/A002487):

```
>>> 16.sternBrocotSequence
[0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]

>>> 0:15.collect(sternBrocotNumber:/1)
[0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]
```

Specific terms:

```
>>> let a = 92.sternBrocotSequence;
>>> a[91 + 1]
19

>>> 91.sternBrocotNumber
19
```

The `gcd` of adjacent values is always `one`:

```
>>> let k = 1000;
>>> let l = k.sternBrocotSequence;
>>> 2:k.allSatisfy { :i |
>>> 	l[i - 1].gcd(l[i]) = 1
>>> }
true
```

Find the index where the number 100 first appears in the sequence:

```
>>> 10000
>>> .sternBrocotSequence
>>> .indexOf(100)
1180
```

First differences of Stern’s diatomic series,
discarding initial two terms,
OEIS [A070990](https://oeis.org/A070990):

```
>>> 17.sternBrocotSequence
>>> .allButFirst(2)
>>> .differences
[1 -1 2 -1 1 -2 3 -1 2 -3 3 -2 1 -3]
```

Stern’s diatomic series,
discrete plot,
OEIS [A002487](https://oeis.org/A002487):

~~~spl svg=A oeis=A002487
200.sternBrocotSequence.discretePlot
~~~

![](Help/Image/sternBrocotSequence-A.svg)

Stern’s diatomic series,
scatter plot,
OEIS [A002487](https://oeis.org/A002487):

~~~spl svg=B oeis=A002487
300.sternBrocotSequence.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-B.svg)

Record values of Stern’s diatomic series,
OEIS [A212289](https://oeis.org/A212289):

~~~spl svg=C oeis=A212289
10000.sternBrocotSequence
.recordValues
.discretePlot
~~~

![](Help/Image/sternBrocotSequence-C.svg)

First differences of Stern’s diatomic series,
discarding initial two terms,
OEIS [A070990](https://oeis.org/A070990):

~~~spl svg=D oeis=A070990
115.sternBrocotSequence
.allButFirst(2)
.differences
.discretePlot
~~~

![](Help/Image/sternBrocotSequence-D.svg)

Second differences of Stern’s diatomic series,
OEIS [A283104](https://oeis.org/A283104):

~~~spl svg=E oeis=A283104
150.sternBrocotSequence
.differences(2)
.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-E.svg)

The smallest number _k_ such that _fusc(k)=n_,
OEIS [A020946](https://oeis.org/A020946):

~~~spl svg=F oeis=A020946
let k = 10000;
let a = k.sternBrocotSequence;
0:200.collect { :n |
	1:k.detect { :i |
		a[i] = n
	}
}.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-F.svg)

Partial sums of Stern’s diatomic series,
OEIS [A174868](https://oeis.org/A174868):

~~~spl svg=G oeis=A174868
85.sternBrocotSequence
.prefixSum
.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-G.svg)

Bitwise exclusive or of adjacent terms of the Stern-Brocot sequence,
OEIS [A283987](https://oeis.org/A283987):

~~~spl svg=H oeis=A283987
let k = 250;
let a = k.sternBrocotSequence;
2:k.collect { :n |
	a[n - 1].bitXor(a[n])
}.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-H.svg)

Bitwise and of adjacent terms of the Stern-Brocot sequence,
OEIS [A283988](https://oeis.org/A283988):

~~~spl svg=I oeis=A283988
let k = 250;
let a = k.sternBrocotSequence;
2:k.collect { :n |
	a[n - 1].bitAnd(a[n])
}.scatterPlot
~~~

![](Help/Image/sternBrocotSequence-I.svg)

* * *

See also: fareySequence, sternBrocotNumber, sternBrocotTree

Guides: Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SternsDiatomicSeries.html)
[2](https://mathworld.wolfram.com/Stern-BrocotTree.html),
_OEIS_
[1](https://oeis.org/A002487),
_W_
[1](https://en.wikipedia.org/wiki/Stern%27s_diatomic_sequence)

Categories: Math, Sequence
