# ^

_aNumber ^ anotherNumber_

Answer _aNumber_ raised to the power of _anotherNumber_.

```
>>> 2 ^ -0.5
0.707107

>>> 2n ^ 100n
1267650600228229401496703205376n
```

At Complex:

```
>>> 2 ^ 0j1
0.769239j0.638961

>>> 0j1 ^ 2
-1j0

>>> 2 ^ (0j1 ^ 2)
0.5j0

>>> -5j0 ^ 0.5
0.j(5.sqrt)
```

Threads elementwise over lists and matrices:

```
>>> [0 1.5 0j1 pi inf] ^ 0.5
[0, 1.22474, -1j0 ^ 0.25, pi.sqrt, inf]

>>> 2 ^ [1 2 3]
[2 4 8]
```

Values at zero:

```
>>> system.nextRandomFloat ^ 0
1

>>> 0 ^ system.nextRandomFloat
0
```

5% compound interest:

```
>>> 1:5.collect { :each | (1 + 0.05) ^ each }
[1.05 1.1025 1.15763 1.21551 1.27628]
```

Plot over a subset of the reals:

```
(0, 0.01 .. 5).collect { :each | each ^ 3 }.plot
```

The name of this operator is _circumflexAccent_.

_Note:_
In Smalltalk ^ is the _return_ operator, in C it is the _exclusive or_ operator.

* * *

See also: *, sqrt, log

Unicode: U+02C6 ˆ Modifier Letter Circumflex Accent

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Power.html)
[2](https://reference.wolfram.com/language/ref/Power.html)

Categories: Math, Operator
