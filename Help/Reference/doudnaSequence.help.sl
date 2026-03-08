# doudnaSequence

- _doudnaSequence(n)_

Answer the first _n_ terms of the Doudna sequence.

First few terms,
OEIS [A005940](https://oeis.org/A005940):

```
>>> 67.doudnaSequence
[
	  1   2   3   4   5
	  6   9   8   7  10
	 15  12  25  18  27
	 16  11  14  21  20
	 35  30  45  24  49
	 50  75  36 125  54
	 81  32  13  22  33
	 28  55  42  63  40
	 77  70 105  60 175
	 90 135  48 121  98
	147 100 245 150 225
	 72 343 250 375 108
	625 162 243  64  17
	 26  39
]
```

There is a function form,
offset by negative one:

```
>>> 0:16.collect(
>>> 	doudnaSequenceFunction:/1
>>> )
[1 2 3 4 5 6 9 8 7 10 15 12 25 18 27 16 11]
```

Linear plot:

~~~spl svg=A
75.doudnaSequence.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-A.svg)

Log-scale plot:

~~~spl svg=B
250.doudnaSequence.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-B.svg)

The least number with the same prime signature as the Doudna sequence entry,
OEIS [A278222](https://oeis.org/A278222):

~~~spl svg=C
65.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/doudnaSequence-C.svg)

Restricted growth sequence of least number with the same prime signature as the Doudna sequence entry,
OEIS[A286622](https://oeis.org/A286622):

~~~spl svg=D
200.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-D.svg)

Ordinal transform of the restricted growth sequence of least number with the same prime signature as the Doudna sequence entry,
OEIS[A286552](https://oeis.org/A286552):

~~~spl svg=E
200.doudnaSequence.collect { :n |
	1:Infinity.detect { :m |
		n.primeSignature
		=
		m.primeSignature
	}
}.restrictedGrowthSequenceTransform
.ordinalTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/doudnaSequence-E.svg)

* * *

See also: digitCount, integerDigits, prime

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A005940)
