# trinomial

- _trinomial(n, k)_

Answer the trinomial coefficient _n,k_.

With positive integer _n_ and _k_:

```
>>> 4.trinomial(2)
10

>>> 6.trinomial(3)
50

>>> 8.trinomial(4)
266

>>> 8.trinomial(5)
504
```

_n_ less than _k_:

```
>>> 3.trinomial(5)
3

>>> 5.trinomial(23)
0
```

Real valued arguments:

```
>>> 8.5.trinomial(-4.2)
0.011897

>>> 2.trinomial(0.5)
1.436942
```

_k_ may be a collection:

```
>>> [10 1 2 5].collect { :each |
>>> 	10.trinomial(each)
>>> }
[8953 10 55 1452]

>>> 10.trinomial([10 1 2 5])
[8953 10 55 1452]
```

Evaluate for half-integer arguments:

```
>>> (9 / 2).trinomial(7 / 2)
26.869537
```

Make the trinomial triangle,
OEIS [A027907](https://oeis.org/A027907):

```
>>> 0:6.collect { :n |
>>> 	let k = [0 .. n * 2];
>>> 	n.trinomial(k)
>>> }
[
	1;
	1 1 1;
	1 2 3 2 1;
	1 3 6 7 6 3 1;
	1 4 10 16 19 16 10 4 1;
	1 5 15 30 45 51 45 30 15 5 1;
	1 6 21 50 90 126 141 126 90 50 21 6 1
]
```

Central trinomial coefficients,
OEIS [A002426](https://oeis.org/A002426):

```
>>> 0:11.collect { :n |
>>> 	n.trinomial(n)
>>> }
[1 1 3 7 19 51 141 393 1107 3139 8953 25653]
```

Partial sums of the central trinomial coefficients,
OEIS [A097893](https://oeis.org/A097893):

```
>>> 0:11.collect { :n |
>>> 	n.trinomial(n)
>>> }.prefixSum
[1 2 5 12 31 82 223 616 1723 4862 13815 39468]
```

Next to central trinomial coefficients,
OEIS [A005717](https://oeis.org/A005717):

```
>>> 0:11.collect { :n |
>>> 	(n + 1).trinomial(n)
>>> }
[1 2 6 16 45 126 357 1016 2907 8350 24068 69576]
```

Third next to central trinomial coefficients,
OEIS [A014531](https://oeis.org/A014531):

```
>>> 0:11.collect { :n |
>>> 	(n + 2).trinomial(n)
>>> }
[1 3 10 30 90 266 784 2304 6765 19855 58278 171106]
```

At `zero`:

```
>>> 0.trinomial(0)
1

>>> 0.trinomial(1)
0

>>> 1.trinomial(0)
1
```

Threads over lists:

```
>>> 5.trinomial([3 4 5])
[30 45 51]

>>> 11:13.trinomial(1:3)
[11 78 442]

>>> [
>>> 	11.trinomial(1),
>>> 	12.trinomial(2),
>>> 	13.trinomial(3)
>>> ]
[11 78 442]
```

Plot over a subset of the reals as a function of its first parameter:

~~~spl svg=A
(-1.975 -- 4).functionPlot { :x |
	x.trinomial(3)
}
~~~

![](Help/Image/trinomial-A.svg)

Plot over a subset of the reals as a function of its second parameter:

~~~spl svg=B
(-1.975 -- 4).functionPlot { :x |
	3.trinomial(x)
}
~~~

![](Help/Image/trinomial-B.svg)

The binary representations for first few terms of a flattened trinomial triangle,
OEIS [A027907](https://oeis.org/A027907):

~~~spl svg=C oeis=A027907
0:7.collect { :n |
	let k = [0 .. n * 2];
	n.trinomial(k).round
}.catenate
.binaryExpansion
.padLeft
.transpose
.matrixPlot
~~~

![](Help/Image/trinomial-C.svg)

* * *

See also: binomial, factorial, multinomial

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TrinomialCoefficient.html)
[2](https://mathworld.wolfram.com/TrinomialTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Trinomial_triangle)
