# ^ (circumflexAccent)

- _x ^ y_
- _x.^_

The binary form answers _x_ raised to the power of _y_.

```
>>> 2L ^ 100L
1267650600228229401496703205376L

>>> 0 ^ 0
1

>>> 2.squared ^ 3
64

>>> 2 ^ 12
4096
```

Fractional exponents:

```
>>> 4 ^ 1/2
2

>>> 8 ^ 1/3
2

>>> 2 ^ 1/2
1.4142
```

Signed exponents:

```
>>> 3 ^ -2
1/9

>>> 2 ^ -1/2
0.707107
```

Signed bases:

```
>>> -7 ^ 2
49

>>> -7 ^ 3
-343

>>> (-7 ^ 0.5).isFinite
false

>>> (-7J0 ^ 0.5, 7.sqrt)
(0J2.6457, 2.6457)

>>> -9J0 ^ 0.5
0J3

>>> -1 ^ 4/7
1
```

At `Complex`:

```
>>> 2 ^ 0J1
0.769239J0.638961

>>> 0J1 ^ 2
-1J0

>>> 2 ^ (0J1 ^ 2)
0.5J0

>>> -5J0 ^ 0.5
0.j(5.sqrt)

>>> 1J1 ^ 1:11
[
	1J1 0J2 -2J2 -4J0 -4J-4
	0J-8 8J-8 16J0 16J16 0J32
	-32J32
]
```

Threads elementwise over lists and matrices:

```
>>> 7 ^ [2 3 4]
[49 343 2401]

>>> [0 1.5 0J1 1.pi 1.inf] ^ 0.5
[0, 1.22474, -1J0 ^ 0.25, 1.pi.sqrt, 1.inf]

>>> 2 ^ [1 2 3 5 10]
[2 4 8 32 1024]

>>> 1:10 ^ 2
[1 4 9 16 25 36 49 64 81 100]

>>> [1 2 3] ^ [2 3 4]
[1 8 81]

>>> 2 ^ (-1 .. 5)
[0.5 1 2 4 8 16 32]

>>> 2 ^ [1.5, 2.4, 2.9, -2.2]
[2.82843 5.27803 7.46426 0.21764]
```

Choose sign based on a `List` of `boole`:

```
>>> -1 ^ [1 0 0 1 0]
[-1 1 1 -1 1]
```

Values at `zero`:

```
>>> system.nextRandomFloat ^ 0
1

>>> 0 ^ system.nextRandomFloat
0

>>> 0 ^ -1
Infinity

>>> Infinity ^ -1
0
```

Five-percent compound interest:

```
>>> 1:5.collect { :each |
>>> 	(1 + 0.05) ^ each
>>> }
[1.05 1.1025 1.15763 1.21551 1.27628]
```

At `LargeInteger`:

```
>>> 23L ^ 23
20880467999847912034355032910567L
```

The unary form is `exp`:

```
>>> 1.^
1.e

>>> [1 2 1.e].^
[2.71828 7.38906 15.15426]

>>> let antiLog = { :x |
>>> 	10 ^ x
>>> };
>>> [1 0.699 -1].antiLog
[10 5 0.1]
```

At `Fraction` answers a fraction if the exponent is an integer:

```
>>> 23/17 ^ 2
529/289

>>> Fraction(23 ^ 2, 17 ^ 2)
529/289

>>> -5/2 ^ 15
-30517578125/32768

>>> 23/1 ^ 23
20880467999847912034355032910567/1
```

and a `SmallFloat` if not:

```
>>> 3/2 ^ 1/2
1.2247

>>> 2/1 ^ 1/16
1.0443
```

Operators are evaluated strictly left to right:

```
>>> 4 * 5 ^ 2 + 7
407

>>> (4 * (5 ^ 2)) + 7
107
```

Scientific notation:

```
>>> 10 ^ 4
1E4
```

For positive integers _y_, _x ^ y_ equals the `product` of _y_ copies of _x_.

```
>>> 3 ^ 5
243

>>> (3 # 5).product
243
```

When _y_ is `zero`, _x ^ y_ equals `one`:

```
>>> [-1 0 1 2 3] ^ 0
[1 1 1 1 1]
```

Negating the exponent gives the `reciprocal` of the answer:

```
>>> 2 ^ -4
(2 ^ 4)./

>>> 10 ^ -2
0.01
```

If the exponent is the `reciprocal` of some number _n_, the result is the _n_-th root of the base,
for example a right argument of _1/2_ gives the square root:

```
>>> 3 ^ 2
9

>>> 9 ^ 1/2
3
```

`^` has two inverses, `nthRoot` and `log`:

```
>>> 2 ^ 3
8

>>> 8.nthRoot(3)
2

>>> 8.log(2)
3
```

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 5).functionPlot { :each |
	each ^ 3
}
~~~

![](sw/spl/Help/Image/circumflexAccent-A.svg)

Plot the `sin` function raised to the first three powers:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	[1 2 3].collect { :n |
		{ :x |
			x.sin ^ n
		}
	}
)
~~~

![](sw/spl/Help/Image/circumflexAccent-B.svg)

Where supported `^` is displayed as ˆ.

The name of this operator is `circumflexAccent`.

_Note:_
In Smalltalk ^ is the _return_ operator, in C it is the _exclusive or_ operator.

* * *

See also: +, -, *, /, exp, factorialPower, log, powerMod, powerRange, sqrt, symmetricPower

References:
_Apl_
[1](https://aplwiki.com/wiki/Power_(function)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Power.html)
[2](https://reference.wolfram.com/language/ref/Power.html),
_Smalltalk_
5.6.2.27,
_W_
[1](https://en.wikipedia.org/wiki/Exponentiation)

Unicode: U+0005E ^ Circumflex Accent, U+02C6 ˆ Modifier Letter Circumflex Accent

Categories: Math, Operator
