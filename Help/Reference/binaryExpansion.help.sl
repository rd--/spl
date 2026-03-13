# binaryExpansion

- _binaryExpansion(n)_

Answer the binary expansion of _n_,
also called binary words or binary vectors.

```
>>> 353.binaryExpansion
[1 0 1 1 0 0 0 0 1]

>>> 353.integerDigits(2)
[1 0 1 1 0 0 0 0 1]

>>> 353.decimalExpansion
[3 5 3]
```

The inverse is `binaryContraction`:

```
>>> [1 0 1 1 0 0 0 0 1].binaryContraction
353

>>> [1 0 1 1 0 0 0 0 1].fromDigits(2)
353
```

Threads over lists,
first few terms,
OEIS [A007088](https://oeis.org/A007088):

```
>>> 0:15.binaryExpansion
[
	0;
	1;
	1 0;
	1 1;
	1 0 0;
	1 0 1;
	1 1 0;
	1 1 1;
	1 0 0 0;
	1 0 0 1;
	1 0 1 0;
	1 0 1 1;
	1 1 0 0;
	1 1 0 1;
	1 1 1 0;
	1 1 1 1
]

>>> 45.binaryExpansion
[1 0 1 1 0 1]
```

Number of ones in the binary expansion of _n_ which have an even number of zeroes at less significant positions,
OEIS [A343029](https://oeis.org/A343029):

~~~spl svg=A oeis=A343029
0:65.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let p = 0;
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.ifTrue {
				p := p + 1
			}
		}
	};
	p
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-A.svg)

Number of ones in the binary expansion of _n_ which have an odd number of zeroes at less significant positions,
OEIS [A343030](https://oeis.org/A343030):

~~~spl svg=B oeis=A343030
0:65.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let q = 0;
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isOdd.ifTrue {
				q := q + 1
			}
		}
	};
	q
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-B.svg)

The Danish composer Per Nørgård’s infinity sequence,
OEIS [A004718](https://oeis.org/A004718):

~~~spl svg=C oeis=A004718
0:65.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let [p, q] = [0, 0];
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.if {
				p := p + 1
			} {
				q := q + 1
			}
		}
	};
	p - q
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-C.svg)

Restricted growth sequence transform of the ordered pair of counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A361020](https://oeis.org/A361020):

~~~spl svg=D oeis=A361020
0:275.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let [p, q] = [0, 0];
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.if {
				p := p + 1
			} {
				q := q + 1
			}
		}
	};
	[p, q]
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-D.svg)

Restricted growth sequence transform of the ordered triple of binary carry sequence and the counts of ones in the binary expansion of _n_ which have an even and odd number of zeroes at less significant positions,
OEIS [A389896](https://oeis.org/A389896):

~~~spl svg=E oeis=A389896
0:275.collect { :n |
	let b = n.binaryExpansion.reverse;
	let z = 0;
	let e = (n + 1).integerExponent(2);
	let [p, q] = [0, 0];
	b.do { :i |
		(i = 0).if {
			z := z + 1
		} {
			z.isEven.if {
				p := p + 1
			} {
				q := q + 1
			}
		}
	};
	[e, p, q]
}.restrictedGrowthSequenceTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-E.svg)

Number of trailing equal digits in binary representation of _n_,
OEIS [A136480](https://oeis.org/A136480):

~~~spl svg=F oeis=A136480
0:65.collect { :n |
	n.binaryExpansion.split(=).last.size
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-E.svg)

Write in binary, complement, reverse,
OEIS [A036044](https://oeis.org/A036044):

~~~spl svg=F oeis=A036044
0:63.collect { :n |
	(1 - n.binaryExpansion)
	.reverse
	.binaryContraction
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-F.svg)

Primes having initial digits _11_ in their binary representation,
OEIS [A080166](https://oeis.org/A080166):

~~~spl svg=G oeis=A080166
1:200.prime.select { :n |
	n.binaryExpansion.first(2) = [1 1]
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-G.svg)

Primes having initial and final digits _11_ in their binary representation,
OEIS [A080168](https://oeis.org/A080168):

~~~spl svg=H oeis=A080168
1:200.prime.select { :n |
	let b = n.binaryExpansion;
	b.first(2) = [1 1] & {
		b.last(2) = [1 1]
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-H.svg)

Working in base two replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A048985](https://oeis.org/A048985):

~~~spl svg=I oeis=A048985
2:200.collect { :n |
	n.primeFactors
	.binaryExpansion
	.catenate
	.binaryContraction
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/binaryExpansion-I.svg)

Working in base two replace _n_ with the concatenation of its prime divisors in increasing order,
OEIS [A064841](https://oeis.org/A064841):

~~~spl svg=J oeis=A064841 set=0,1
1:25.collect { :n |
	n.primeFactors
	.binaryExpansion
	.catenate
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-J.svg)

The difference between the number of zeroes and ones in the base-two representation _n_,
OEIS [A037861](https://oeis.org/A037861):

~~~spl svg=K oeis=A037861 signed
0:95.collect { :n |
	let b = n.binaryExpansion;
	let k = b.size;
	let i = b.occurrencesOf(0);
	i - (k - i)
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-K.svg)

In the binary expansion of _n_,
sum the exponents associated with one terms and subtract the exponents associated with zero terms,
OEIS [A309983](https://oeis.org/A309983):

~~~spl svg=L oeis=A309983
1:85.collect { :n |
	let b = n.binaryExpansion;
	let p = 2 * b.allButLast - 1;
	let k = p.size;
	(p * k:1:-1).sum
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-L.svg)

_2^n_ zeroes followed by _2^n_ ones,
OEIS [A079944](https://oeis.org/A079944):

~~~spl svg=M oeis=A079944 set=0,1
0:65.collect { :n |
	(n + 2).binaryExpansion.second
}.discretePlot
~~~

![](sw/spl/Help/Image/binaryExpansion-M.svg)

* * *

See also: decimalExpansion, integerDigits

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A007088)
_W_
[1](https://en.wikipedia.org/wiki/Binary_number)
