# Complex

- _Complex(real, imaginary)_

A `Type` representing a complex number with the specified `real` and `imaginary` parts.

Answer a `Complex` number:

```
>>> Complex(1, 5)
1J5
```

Threads overs lists and arrays:

```
>>> 1:5.Complex(5:9)
[1J5 2J6 3J7 4J8 5J9]
```

There is a literal syntax:

```
>>> 1J5
Complex(1, 5)

>>> 0J1 * 0J1
-1J0
```

`Complex` implements `*`, `/`, `+`, `-` and `^`:

```
>>> 1J2 * 2J-3
8J1

>>> 1J2 / 1J-2
-0.6J0.8

>>> 1J2 + 1J-2
2J0

>>> -3J2 - 5J-1
-8J3

>>> -1J2 ^ 1J1
-0.27910J0.08708
```

`Complex` adapts to non-`Complex` operands, and vice-versa:

```
>>> -1J2 ^ 2
-3J-4

>>> -1J2 ^ 2.5
2.72962J-6.96066

>>> 3 * 2J-5
6J-15

>>> 3 * (2J-5 ^ 2)
-63J-60

>>> 3 * (2J-5 ^ -1)
0.20690J0.51724
```

Combinations of operands of different types:

```
>>> 2 * 1J-1
2J-2

>>> 2J3 - 1
1J3

>>> 1J2 + 0.5
1.5J2

>>> 2J3 - 0J0.5
2J2.5

>>> 0.75 * 1J2
0.75J1.5

>>> 2J3 / 2
1J1.5

>>> 1J-3 / 2J2
-0.5J-1

>>> 0J2 ^ 2
-4J0
```

`real` & `imaginary` answer the components.
`abs` (absolute value) answers the distance from zero.
`absSquare` answers the square of the absolute value.
`arg` answers the phase angle in radians.

```
>>> 1J2.real
1

>>> 1J2.imaginary
2

>>> 1J2.conjugate
1J-2

>>> 1J2.abs
2.23607

>>> 1J2.absSquare
5

>>> 1J2.arg
1.10715
```

Standard functions:

```
>>> 0J1.sqrt
0.70711J0.70711

>>> 1J2.sqrt
1.27202J0.78615

>>> 1J2.cos
2.03272J-3.05190

>>> 1J2.exp
-1.13120J2.47173

>>> 1J2.sinh
-0.48906J1.40312
```

The `printString` of a `Complex` number is the literal notation:

```
>>> 1J2.printString
'1J2'
```

The `storeString` of a `Complex` number is the constructor notation:

```
>>> 1J2.storeString
'Complex(1, 2)'
```

Use `real` and `imaginary` to extract parts of `Complex` numbers:

```
>>> let c = 1J2;
>>> (c.real, c.imaginary)
(1, 2)
```

The `asList` method answers a two `List` of the real and imaginary components:

```
>>> 1J2.asList
[1 2]
```

The `asComplex` method is defined at `List`:

```
>>> [1 2].asComplex
1J2
```

The `isReal` predicate answers `false` if the imaginary part is not `zero`,
or if the number is not a `Complex` number:

```
>>> 0J1.isReal
false

>>> 1J0.isReal
true

>>> 1.isReal
true

>>> 1/3.isReal
true

>>> 1.pi.isReal
true

>>> 23L.isReal
true
```

* * *

See also: abs, absArg, arg, isGaussianInteger, asInteger, asNumber, conjugate, i, imaginary, j, real, SmallFloat

Guides: Complex Numbers

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_number),
_Julia_
[1](https://docs.julialang.org/en/v1/manual/complex-and-rational-numbers/),
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexNumber.html)
[2](https://reference.wolfram.com/language/ref/Complex.html),
_W_
[1](https://en.wikipedia.org/wiki/Complex_number)

Categories: Math, Numeric, Type
