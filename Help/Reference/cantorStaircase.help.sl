# cantorStaircase

- _cantorStaircase(x, n=12)_

Answer the Cantor staircase function,
a continuous but not absolutely continuous function on _[0,1]_.

```
>>> 1/3.cantorStaircase
1/2

>>> 3/10.cantorStaircase(3L)
31/80

>>> 1/10.cantorStaircase(0L)
1/10

>>> 29/100.cantorStaircase(4L)
3/8

>>> 11/100.cantorStaircase(5L)
773/3200

>>> 1/3.cantorStaircase(2L)
1/2

>>> 19/25.cantorStaircase(4L)
11/16

>>> 0L.cantorStaircase(1L)
0/1

>>> 15/17.cantorStaircase(2L)
3/4

>>> (1.0 / 2.sqrt).cantorStaircase(3.0)
5/8
```

Threads elementwise over lists:

```
>>> (0L:9L / 9L).cantorStaircase
[0/1 1/4 1/4 1/2 1/2 1/2 1/2 3/4 3/4 1/1]
```

The integrals of the n-th powers of the Cantor function,
c.f. OEIS [A095844](https://oeis.org/A095844) and [A095845](https://oeis.org/A095845):

```
>>> let f = { :n |
>>> 	n.caseOf([
>>> 		0L -> { 1/1 },
>>> 		1L -> { 1/2 }
>>> 	]) {
>>> 		let a = 1L / (3L * (2L ^ n) - 2L);
>>> 		let b = [1L .. n - 1L];
>>> 		let c = 2L + b.collect { :k |
>>> 			n.binomial(k) * f(k)
>>> 		}.sum;
>>> 		a * c
>>> 	}
>>> };
>>> 0L:7L.collect(f/1)
[
	1/1 1/2 3/10 1/5 33/230 5/46
	75/874 611/8740
]
```

Plot over the unit interval:

~~~spl svg=A
(0.0 -- 1.0).functionPlot(
	cantorStaircase/1
)
~~~

![](Help/Image/cantorStaircase-A.svg)

* * *

See also: integerDigits, minkowskiQuestionMark

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CantorFunction.html)
[2](https://reference.wolfram.com/language/ref/CantorStaircase.html),
_OEIS_
[1](https://oeis.org/A095844)
[2](https://oeis.org/A095845),
_W_
[1](https://en.wikipedia.org/wiki/Cantor_function)
