# bernoulliNumber

- _bernoulliNumber(n)_

Answer the _n_-th Bernoulli number.

The first eleven Bernoulli numbers:

```
>>> 0:10.collect(bernoulliNumber:/1)
[
	1/1 -1/2 1/6 0 -1/30
	0 1/42 0 -1/30 0
	5/66
]
```

The 20th Bernoulli number:

```
>>> let n = 20.bernoulliNumber;
>>> (n, n.asFloat)
(-174611/330, -529.12424)
```

The 60th Bernoulli number:

```
>>> 60.bernoulliNumber
-1215233140483755572040304994079820246041491L
/
56786730L
```

Relation to Euler numbers and π:

```
>>> let n = 9;
>>> let m = 2 * n;
>>> let b = m.bernoulliNumber;
>>> let e = m.eulerNumber;
>>> 2 * ((2 ^ m) - (4 ^ m)) * (b / e)
1.pi
```

The _2n_-th Bernoulli numbers divided by _2n_:

```
>>> 1:8.collect { :n |
>>> 	let m = 2 * n;
>>> 	m.bernoulliNumber / m
>>> }
[
	1/12 -1/120 1/252 -1/240 1/132
	-691/32760 1/12 -3617/8160
]
```

Plot absolute value of numerators on `log` scale:

~~~spl svg=A
1:50.collect { :n |
	n.bernoulliNumber
	.numerator
	.abs
	.logScale
}.scatterPlot
~~~

![](sw/spl/Help/Image/bernoulliNumber-A.svg)

* * *

See also: bernoulliSequence, eulerNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliNumber.html)
[2](https://reference.wolfram.com/language/ref/BernoulliB.html),
_OEIS_
[1](https://oeis.org/A000367)
[2](https://oeis.org/A002445)
[3](https://oeis.org/A001067)
[4](https://oeis.org/A006953),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.bernoulli),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_number)
