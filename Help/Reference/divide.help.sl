# divide

- _m / n_

Answers the number _m_ divided by the number _n_.
The operator form is `/`.

At `SmallFloat`:

```
>>> 77 / 11
7

>>> 77 * (11 ^ -1)
7

>>> 2 / 4
0.5

>>> 1 / 81
0.01234567
```

Divide threads element-wise over lists:

```
>>> [2 3 4 5] / 3
[2/3 1 4/3 5/3]

>>> [2 1 5] / [4 1 2]
[0.5 1 2.5]

>>> [3J1 2.5 4J5] / [2 1J1 0.2]
[1.5J0.5 1.25J-1.25 20J25]

>>> [2 4; 6 9] / [2 3]
[1 2; 2 3]
```

Divide is applied sequentially:

```
>>> 3 / 5 / 7 / 9
(3 / (5 * 7 * 9))
```

At `LargeInteger` answers a `Fraction`:

```
>>> let r = 2L / 3L;
>>> (r, r.isFraction)
(2/3, true)
```

At `SmallFloat` answers a `SmallFloat`,
to answer a `Fraction` divide by a fraction literal:

```
>>> [1 2 3] / 4/1
[1/4 1/2 3/4]
```

At `Complex` answers a `Complex`:

```
>>> 9.4J6 / 1J1
7.7J-1.7

>>> 3J1 / 2
1.5J0.5
```

Division by `zero` may be `Infinity`, `NaN` or an `error`:

```
>>> 5 / 0
Infinity

>>> (5J3 / 0).isNaN
true

>>> { 5/3 / 0 }.hasError
true
```

Integer division does not neccesarily answer an integer, c.f. `//`:

```
>>> 7 / 3
2.3333

>>> 7 // 3
2
```

At `Symbol`:

```
>> `m` / `n`
(/ m n)

>> `m`./
(/ 1 m)
```

Plot equal divisions of the unit interval _(0,1)_,
the _y_ coordinate is given by the order of the divisions:

~~~spl svg=A
1:20.collect { :y |
	(1:y / y).collect { :x |
		[x y]
	}
}.scatterPlot
~~~

![](sw/spl/Help/Image/divide-A.svg)

* * *

See also: /, //, +, -, *, times

Guides: Arithmetic Functions, Binary Operators, Mathematical Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Divide),
_Haskell_
[1](https://hackage.haskell.org/package/base-4.19.1.0/docs/Prelude.html#v:-47-),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/percent),
_Mathematica_
[1](https://mathworld.wolfram.com/Division.html)
[2](https://mathworld.wolfram.com/Divide.html)
[3](https://reference.wolfram.com/language/ref/Divide.html),
_Smalltalk_
5.6.2.4
5.6.2.29,
_W_
[1](https://en.wikipedia.org/wiki/Division_(mathematics))

Categories: Math, Operator
