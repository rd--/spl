# bernoulliNumber

- _bernoulliNumber(n)_

Answer the _n_-th Bernoulli number.

The first eleven Bernoulli numbers,
threads over lists:

```
>>> 0:10.bernoulliNumber
[
	1/1 -1/2 1/6 0 -1/30
	0 1/42 0 -1/30 0
	5/66
]
```

Numerators are
OEIS [A027641](https://oeis.org/A027641);

```
>>> 0:16.bernoulliNumber.numerator
[1 -1 1 0 -1 0 1 0 -1 0 5 0 -691 0 7 0 -3617]
```

Denominators are
OEIS [A027642](https://oeis.org/A027642):

```
>>> 0:16.bernoulliNumber.denominator
[1 2 6 1 30 1 42 1 30 1 66 1 2730 1 6 1 510]
```

The 20th and 40th Bernoulli numbers:

```
>>> let n = 20.bernoulliNumber;
>>> (n, n.asFloat)
(-174611/330, -529.12424)

>>> 40.bernoulliNumber
-261082718496449122051L
/
13530
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

Numerators of Bernoulli numbers,
OEIS [A164555](https://oeis.org/A164555):

```
>>> 0:16.bernoulliNumber.numerator
[1 -1 1 0 -1 0 1 0 -1 0 5 0 -691 0 7 0 -3617]
```

Numerators of Bernoulli numbers _2n_,
OEIS [A000367](https://oeis.org/A000367):

```
>>> 0:20:2.bernoulliNumber.numerator
[1 1 -1 1 -1 5 -691 7 -3617 43867 -174611]
```

Denominators of Bernoulli numbers _2n_,
OEIS [A002445](https://oeis.org/A002445):

```
>>> 0:22:2.bernoulliNumber.denominator
[1 6 30 42 30 66 2730 6 510 798 330 138]
```

Absolute value of numerators of Bernoulli numbers,
`log` scale plot,
the unsigned variant of
OEIS [A027641](https://oeis.org/A027641):

~~~spl svg=A oeis=A027641 variant
0:50.bernoulliNumber
.numerator.abs
.scatterPlot.logScale
~~~

![](Help/Image/bernoulliNumber-A.svg)

Numerators of Bernoulli numbers,
`log` scale plot,
OEIS [A027641](https://oeis.org/A027641):

~~~spl svg=B oeis=A027641
0:50.bernoulliNumber
.numerator
.scatterPlot.logScale
~~~

![](Help/Image/bernoulliNumber-B.svg)

Denominators of Bernoulli numbers,
`log` scale plot,
OEIS [A027642](https://oeis.org/A027642):

~~~spl svg=C oeis=A027642
0:50.bernoulliNumber
.denominator
.discretePlot.logScale
~~~

![](Help/Image/bernoulliNumber-C.svg)

* * *

See also: bernoulliSequence, eulerNumber, genocchiNumber

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BernoulliNumber.html)
[2](https://reference.wolfram.com/language/ref/BernoulliB.html),
_OEIS_
[1](https://oeis.org/A000367)
[2](https://oeis.org/A002445)
[3](https://oeis.org/A001067)
[4](https://oeis.org/A006953)
[5](https://oeis.org/A007703),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.numbers.bernoulli),
_W_
[1](https://en.wikipedia.org/wiki/Bernoulli_number)
