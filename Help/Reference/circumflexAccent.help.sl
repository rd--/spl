# ^ (circumflexAccent)

- _aNumber ^ anotherNumber_
- _aNumber.^_

The binary form answers _aNumber_ raised to the power of _anotherNumber_.

```
>>> 2 ^ -0.5
0.707107

>>> 2n ^ 100n
1267650600228229401496703205376n

>>> 3 ^ -2
1/9
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
>>> [0 1.5 0J1 pi inf] ^ 0.5
[0, 1.22474, -1J0 ^ 0.25, pi.sqrt, inf]

>>> 2 ^ [1 2 3]
[2 4 8]

>>> 1:10 ^ 2
[1 4 9 16 25 36 49 64 81 100]

>>> [1 2 3] ^ [2 3 4]
[1 8 81]
```

Values at `zero`:

```
>>> system.nextRandomFloat ^ 0
1

>>> 0 ^ system.nextRandomFloat
0
```

Five-percent compound interest:

```
>>> 1:5.collect { :each | (1 + 0.05) ^ each }
[1.05 1.1025 1.15763 1.21551 1.27628]
```

At `LargeInteger`:

```
>>> 33n ^ 33
129110040087761027839616029934664535539337183380513n
```

The unary form is `exp`:

```
>>> 1.^
e

>>> [1 2 e].^
[2.71828 7.38906 15.15426]

>>> let antiLog = { :x | 10 ^ x };
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
```

and a `SmallFloat` if not:

```
>>> 3/2 ^ 1/2
1.2247
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

Plot over a subset of the reals:

~~~spl svg=A
(0 -- 5).functionPlot(50) { :each | each ^ 3 }
~~~

![](sw/spl/Help/Image/circumflexAccent-A.svg)

Where supported `^` is displayed as ˆ.

The name of this operator is `circumflexAccent`.

_Note:_
In Smalltalk ^ is the _return_ operator, in C it is the _exclusive or_ operator.

* * *

See also: +, -, *, /, exp, sqrt, log

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
