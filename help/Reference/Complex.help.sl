# Complex

- _Complex(real, imaginary)_

Answer a `Complex` number with the indicated _real_ and _imaginary_ parts.

Threads overs lists and arrays:

```
>>> 1:5.Complex(5:9)
[1J5 2J6 3J7 4J8 5J9]
```

There is a literal syntax:

```
>>> 1J5
Complex(1, 5)
```

Complex implements `*`, `/`, `+`, `-` and `^`:

```
>>> 1j2 * 2j-3
8j1

>>> 1j2 / 1j-2
-0.6j0.8

>>> 1j2 + 1j-2
2j0

>>> -3j2 - 5j-1
-8j3

>>> -1j2 ^ 1j1
-0.27910j0.08708
```

Complex adapts to non-Complex operands, and vice-versa:

```
>>> -1j2 ^ 2
-3j-4

>>> -1j2 ^ 2.5
2.72962j-6.96066

>>> 3 * 2j-5
6j-15

>>> 3 * (2j-5 ^ 2)
-63j-60

>>> 3 * (2j-5 ^ -1)
0.20690j0.51724
```

Combinations of operands of different types:

```
>>> 2 * 1j-1
2j-2

>>> 2j3 - 1
1j3

>>> 1j2 + 0.5
1.5j2

>>> 2j3 - 0j0.5
2j2.5

>>> 0.75 * 1j2
0.75j1.5

>>> 2j3 / 2
1j1.5

>>> 1j-3 / 2j2
-0.5j-1

>>> 0j2 ^ 2
-4j0
```

`real` & `imaginary` answer the components.
`abs` (absolute value) answers the distance from zero.
`absSquared` answers the square of the absolute value.
`arg` answers the phase angle in radians.

```
>>> 1j2.real
1

>>> 1j2.imaginary
2

>>> 1j2.conjugated
1j-2

>>> 1j2.abs
2.23607

>>> 1j2.absSquared
5

>>> 1j2.arg
1.10715
```

Standard functions:

```
>>> 0j1.sqrt
0.70711j0.70711

>>> 1j2.sqrt
1.27202j0.78615

>>> 1j2.cos
2.03272j-3.05190

>>> 1j2.exp
-1.13120j2.47173

>>> 1j2.sinh
-0.48906j1.40312
```

The `storeString` of a `Complex` number is the constructor notation:

```
>>> 1j2.storeString
'Complex(1, 2)'
```

Use `real` and `imaginary` to extract parts of `Complex` numbers:

```
>>> let c = 1j2;
>>> (c.real, c.imaginary)
(1, 2)
```

The `asTuple` method answers a two tuple of the real and imaginary components:

```
>>> 1j2.asTuple
(1, 2)
```

`asComplex` method is defined at `List` and `Tuple`:

```
>>> [1, 2].asComplex
1j2

>>> (1, 2).asComplex
1j2
```

* * *

See also: abs, absArg, arg, isGaussianInteger, asInteger, asNumber, conjugated, i, imaginary, j, real, SmallFloat

References:
_Apl_
[1](https://aplwiki.com/wiki/Complex_number),
_Julia_
[1](https://docs.julialang.org/en/v1/manual/complex-and-rational-numbers/),
_Mathematica_
[1](https://mathworld.wolfram.com/ComplexNumber.html)
[2](https://reference.wolfram.com/language/ref/Complex.html)

Categories: Math, Numeric, Type
