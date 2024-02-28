# ^

- _aNumber ^ anotherNumber_
- _aNumber.^_

The binary form answers _aNumber_ raised to the power of _anotherNumber_.

```
>>> 2 ^ -0.5
0.707107

>>> 2n ^ 100n
1267650600228229401496703205376n
```

At `Complex`:

```
>>> 2 ^ 0j1
0.769239j0.638961

>>> 0j1 ^ 2
-1j0

>>> 2 ^ (0j1 ^ 2)
0.5j0

>>> -5j0 ^ 0.5
0.j(5.sqrt)

>>> 1j1 ^ 1:11
[1j1 0j2 -2j2 -4j0 -4j-4 0j-8 8j-8 16j0 16j16 0j32 -32j32]
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0j1 pi inf] ^ 0.5
[0, 1.22474, -1j0 ^ 0.25, pi.sqrt, inf]

>>> 2 ^ [1 2 3]
[2 4 8]

>>> 1:10 ^ 2
[1 4 9 16 25 36 49 64 81 100]
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

The unary form is _exp_:

```
>>> 1.^
e

>>> [1 2 e].^
[2.71828 7.38906 15.15426]
```

Plot over a subset of the reals:

~~~
(0, 0.01 .. 5).collect { :each | each ^ 3 }.plot
~~~

Where supported this operator is displayed as _ˆ_.

The name of this operator is _circumflexAccent_.

_Note:_
In Smalltalk ^ is the _return_ operator, in C it is the _exclusive or_ operator.

* * *

See also: +, -, *, /, exp, sqrt, log

Unicode: U+02C6 ˆ Modifier Letter Circumflex Accent

References:
_Apl_
[1](https://aplwiki.com/wiki/Power_(function)),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/hat#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/Power.html)
[2](https://reference.wolfram.com/language/ref/Power.html),
_W_
[1](https://en.wikipedia.org/wiki/Exponentiation)

Categories: Math, Operator
