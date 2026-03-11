# negabinaryExpansion

- _negabinaryExpansion(n)_

Answer the base negative two representation of _n_.

Base negative two representation of _n_,
OEIS [A039724](https://oeis.org/A039724):

```
>>> 0:20.negabinaryExpansion
>>> .collect { :n |
>>> 	n.fromDigits
>>> }
[
	    0
	    1
	  110
	  111
	  100
	  101
	11010
	11011
	11000
	11001
	11110
	11111
	11100
	11101
	10010
	10011
	10000
	10001
	10110
	10111
	10100
]
```

The numbers having the same representation in binary and negabinary,
the Moser–de Bruijn sequence,
OEIS [A000695](https://oeis.org/A000695):

```
>>> 0:1200.select { :n |
>>> 	let a = n.negabinaryExpansion;
>>> 	let b = n.binaryExpansion;
>>> 	a = b
>>> }
48.moserDeBruijnSequence
```

Number of ones when _n_ is written in base negative two,
OEIS [A027615](https://oeis.org/A027615):

```
>>> 0:21.collect { :n |
>>> 	n.negabinaryExpansion
>>> 	.occurrencesOf(1)
>>> }
[0 1 2 3 1 2 3 4 2 3 4 5 3 4 2 3 1 2 3 4 2 3]
```

Base negative two is supported by `integerDigits` and therefore `digitCount`:

```
>>> 19.integerDigits(-2)
[1 0 1 1 1]

>>> 0:21.collect { :n |
>>> 	n.digitCount(-2, 1)
>>> }
[0 1 2 3 1 2 3 4 2 3 4 5 3 4 2 3 1 2 3 4 2 3]
```

Regarded as base two and then evaluated,
OEIS [A005351](https://oeis.org/A005351):

```
>>> 0:20.negabinaryExpansion
>>> .collect { :n |
>>> 	n.fromDigits(2)
>>> }
[
	 0  1  6  7  4  5 26 27 24 25
	30 31 28 29 18 19 16 17 22 23
	20
]
```

Regarded as base two and then evaluated,
OEIS [A005351](https://oeis.org/A005351):

~~~spl svg=A
0:341.negabinaryExpansion
.collect { :n |
	n.fromDigits(2)
}.stepPlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-A.svg)

Alternating sum of reverse of negabinary expansion of _n_,
[A065360](https://oeis.org/A065360):

~~~spl svg=B
0:99.collect { :n |
	n.negabinaryExpansion
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-B.svg)

Number of ones when _n_ is written in base negative two,
OEIS [A027615](https://oeis.org/A027615):

~~~spl svg=C
0:85.collect { :n |
	n.negabinaryExpansion
	.occurrencesOf(1)
}.discretePlot
~~~

![](sw/spl/Help/Image/negabinaryExpansion-C.svg)

* * *

See also: binaryExpansion, digitCount, integerDigits

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Negabinary.html),
_W_
[1](https://en.wikipedia.org/wiki/Negative_base)
