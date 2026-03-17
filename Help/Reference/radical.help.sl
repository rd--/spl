# radical

- _radical(n)_

Answer the radical of the integer _n_,
the product of the prime divisors.

```
>>> 999999.radical
111111
```

First few terms,
threads over lists,
OEIS [A007947](https://oeis.org/A007947):

```
>>> 1:78.radical
[
	 1  2  3  2  5  6  7  2  3 10
	11  6 13 14 15  2 17  6 19 10
	21 22 23  6  5 26  3 14 29 30
	31  2 33 34 35  6 37 38 39 10
	41 42 43 22 15 46 47  6  7 10
	51 26 53  6 55 14 57 58 59 30
	61 62 21  2 65 66 67 34 69 70
	71  6 73 74 15 38 77 78
]
```

Partial sums,
OEIS [A073355](https://oeis.org/A073355):

```
>>> 1:13.radical.prefixSum
[1 3 6 8 13 19 26 28 31 41 52 58 71]
```

_μ(r(n))_,
OEIS [A076479](https://oeis.org/A076479):

```
>>> 1:16.radical.moebiusMu
[1 -1 -1 -1 -1 1 -1 -1 -1 1 -1 1 -1 1 1 -1]
```

Radical of the integer _n_,
OEIS [A007947](https://oeis.org/A007947):

~~~spl svg=A oeis=A007947
1:150.radical.scatterPlot
~~~

![](sw/spl/Help/Image/radical-A.svg)

Radical of the integer _n_,
log plot,
OEIS [A007947](https://oeis.org/A007947):

~~~spl svg=B oeis=A007947
1:300.radical.log.scatterPlot
~~~

![](sw/spl/Help/Image/radical-B.svg)

_μ(r(n))_,
OEIS [A076479](https://oeis.org/A076479):

~~~spl svg=C oeis=A076479
1:85.radical.moebiusMu.discretePlot
~~~

![](sw/spl/Help/Image/radical-C.svg)

_r(n*r(n)+1)_
OEIS [A078322](https://oeis.org/A078322):

~~~spl svg=D oeis=A078322
1:85.collect { :n |
	(n * n.radical + 1).radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-D.svg)

_n*r(n)+1_
OEIS [A078310](https://oeis.org/A078310):

~~~spl svg=E oeis=A078310
1:85.collect { :n |
	n * n.radical + 1
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-E.svg)

_n-r(n)_
OEIS [A066503](https://oeis.org/A066503):

~~~spl svg=F oeis=A066503
1:85.collect { :n |
	n - n.radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-F.svg)

Squarefree kernel of _n_ divided by the squarefree part of _n_,
_r(n)/c(n)_,
OEIS [A336643](https://oeis.org/A336643):

~~~spl svg=G oeis=A336643
1:85.collect { :n |
	n.radical / n.squareFreePart
}.stepPlot
~~~

![](sw/spl/Help/Image/radical-G.svg)

_gcd(r(n),n/r(n))_,
OEIS [A071773](https://oeis.org/A071773):

~~~spl svg=H oeis=A071773
1:85.collect { :n |
	let r = n.radical;
	r.gcd(n / r)
}.stepPlot
~~~

![](sw/spl/Help/Image/radical-H.svg)

_n^2/r(n)_,
OEIS [A102631](https://oeis.org/A102631):

~~~spl svg=I oeis=A102631
1:85.collect { :n |
	n.square / n.radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-I.svg)

_r(n)^2_,
OEIS [A078615](https://oeis.org/A078615):

~~~spl svg=J oeis=A078615
1:150.radical.square.scatterPlot
~~~

![](sw/spl/Help/Image/radical-J.svg)

_n_ divided by the largest power of the squarefree kernel of _n_ which divides it,
OEIS [A062760](https://oeis.org/A062760):

~~~spl svg=K oeis=A062760
2:200.collect { :n |
	let p = n.divisors;
	let q = p.select(isSquareFree:/1).last;
	n / (q ^n.integerExponent(q))
}.log.discretePlot
~~~

![](sw/spl/Help/Image/radical-K.svg)

_r(P(n)-1)_,
OEIS [A077063](https://oeis.org/A077063):

~~~spl svg=L oeis=A077063
1:115.collect { :n |
	(n.prime - 1).radical
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-L.svg)

_ω(n*r(n)+1)_
OEIS [A078313](https://oeis.org/A078313):

~~~spl svg=M oeis=A078313
1:85.collect { :n |
	(n * n.radical + 1).primeNu
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-M.svg)

_Ω(n*r(n)+1)_
OEIS [A078314](https://oeis.org/A078314):

~~~spl svg=N oeis=A078314
1:85.collect { :n |
	(n * n.radical + 1).primeOmega
}.discretePlot
~~~

![](sw/spl/Help/Image/radical-N.svg)

* * *

See also: factorInteger, product

Guides: Integer Functions, Integer Sequence Functions, Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A007947),
_W_
[1](https://en.wikipedia.org/wiki/Radical_of_an_integer)
