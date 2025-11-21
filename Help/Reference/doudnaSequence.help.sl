+@Integer{
	doudnaSequenceFunction { :n |
		let a = n.integerDigits(2);
		let b = a.reverse;
		let c = b.indicesOf(1);
		let d = 1.to(n.digitCount(2, 1));
		let e = c - d + 1;
		e.prime.product
	}
	doudnaSequence { :n |
		0.toCollect(n - 1, doudnaSequenceFunction:/1)
	}
}

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

* * *

See also: digitCount, integerDigits, prime

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/x.html)
_OEIS_
[1](https://oeis.org/A005940)
