# fareySequence

- _fareySequence(n)_

Answer the Farey sequence of order _n_.

The Farey sequence of order _n_ is the sorted sequence of reduced fractions between 0 and 1 with denominators not exceeding _n_.

The Farey sequence of order five:

```
>>> 5.fareySequence
[
	0/1 1/5 1/4 1/3 2/5
	1/2 3/5 2/3 3/4 4/5
	1/1
]
```

The Farey sequence of order six:

```
>>> 6.fareySequence
[
	0/1 1/6 1/5 1/4 1/3 2/5
	1/2 3/5 2/3 3/4 4/5 5/6
	1/1
]
```

Find the 17th element of the Farey sequence of order 24,
and the 500th of order 50:

```
>>> 24.fareySequence[17]
2/21

>>> 50.fareySequence[500]
29/45
```

Denominators of Farey sequence of order 12:

```
>>> 12.fareySequence
>>> .collect(denominator:/1)
[
	1 12 11 10 9 8 7 6 11 5 9 4
	11 7 10 3 11 8 5 12 7 9 11
	2
	11 9 7 12 5 8 11 3 10 7 11
	4 9 5 11 6 7 8 9 10 11 12 1
]
```

The length of a Farey sequence for a few small orders,
c.f. OEIS [A005728](https://oeis.org/A005728):

```
>>> 1:12.collect(fareySequence:/1)
>>> .collect(size:/1)
[2 3 5 7 11 13 19 23 29 33 43 47]
```

Compare with a closed-form formula in terms of Euler’s totient function `eulerPhi`:

```
>>> 1:12.collect { :n |
>>> 	1 + 1:n.collect(eulerPhi:/1).sum
>>> }
[2 3 5 7 11 13 19 23 29 33 43 47]
```

The product of all nonzero elements of the Farey sequence for a few small orders:

```
>>> 2:11.collect { :n |
>>> 	n.fareySequence
>>> 	.allButFirst
>>> 	.product
>>> }
[
	1/2 1/9 1/48 1/1250
	1/9000 2/2941225 3/172103680
	1/13610558304 1/720135360000
	1/5147281912068450
]
```

Lengths of longer Farey sequences, _50_ then _200, 300, 400, 500_:

```
>>> 50.fareySequence.size
775

>>> (2:5 * 100).collect { :n |
>>> 	n.fareySequence.size
>>> }
[12233 27399 48679 76117]
```

Plot terms of Farey sequence:

~~~spl svg=A
23.fareySequence.linePlot
~~~

![](sw/spl/Help/Image/fareySequence-A.svg)

Plot numerators:

~~~spl svg=B
23.fareySequence
.numerator
.discretePlot
~~~

![](sw/spl/Help/Image/fareySequence-B.svg)

Plot denominators:

~~~spl svg=C
23.fareySequence
.denominator
.discretePlot
~~~

![](sw/spl/Help/Image/fareySequence-C.svg)

Plot diferrences between adjacent mediants:

~~~spl svg=D
let f = 20.fareySequence;
(2 .. f.size - 1).collect { :i |
	let p = f[i - 1].mediant(f[i]);
	let q = f[i].mediant(f[i + 1]);
	q - p
}.discretePlot
~~~

![](sw/spl/Help/Image/fareySequence-D.svg)

Draw the Farey sunburst:

~~~spl svg=E
let x = 9.fareySequence.collect(asList:/1);
let y = x.collect(reverse:/1);
[1 1; 1 -1; -1 1; -1 -1].collect { :m |
	[
		([m] * x).Line,
		([m] * y).Line
	]
}.LineDrawing
~~~

![](sw/spl/Help/Image/fareySequence-E.svg)

* * *

See also: Fraction, eulerPhi, gcd, isFareyPair, minkowskiQuestionMark, sternBrocotSequence, subdivide

Guides: Integer Functions,Integer Sequence Functions, Mathematical Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FareySequence.html)
[2](https://reference.wolfram.com/language/ref/FareySequence.html),
_OEIS_
[1](https://oeis.org/A005728)
[2](https://oeis.org/A006842)
[3](https://oeis.org/A006843)

Categories: Math, Sequence
