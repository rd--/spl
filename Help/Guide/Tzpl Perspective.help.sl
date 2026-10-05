# Tzpl Perspective

## General Numeric Functions

`abs`, `sign`, `min`, `max`, `clamp`, cmp=`compare`, `gcd`, `lcm`

`abs`:

```
>>> -5.abs
5

>>> -3.14.abs
3.14

>>> (3+4I).abs
5
```

`clamp`:

```
>>> 15.clamp(0, 10)
10

>>> -5.clamp(0, 10)
0

>>> 5.clamp(0, 10)
5
```

`gcd`:

```
>>> gcd(12, 8)
4

>>> gcd(7, 13)
1

>>> gcd(0, 5)
5

>>> gcd(-12, 8)
4
```

`lcm`:

```
>>> lcm(4, 6)
12

>>> lcm(7, 13)
91

>>> lcm(0, 5)
0

>>> lcm(-4, 6)
12
```

## Rounding Functions

`floor`, ceil=`ceiling`, `round`, trunc=`truncate`, frac=`fractionalPart`

```
>>> 3.7.floor
3

>>> 3.2.ceiling
4

>>> 2.5.round
3

>>> -3.7.truncate
-3

>>> 3.75.fractionalPart
0.75
```

## Powers & Roots

`sqrt`, cbrt=`cubeRoot`, pow=`power` (`^`), hypot=`hypotenuse`, remainder=`ieeeRemainder`

```
>>> 16.sqrt
4

>>> 27.cubeRoot
3

>>> power(2, 10)
1024

>>> hypotenuse(3, 4)
5

>>> ieeeRemainder(5.5, 2)
-0.5
```

## Exponential & Logarithmic Functions

`exp`, exp2, exp10, expm1, `log`, `log2`, `log10`, log1p

```
>>> 1.0.exp
2.718281828

>>> 1.exp.log
1

>>> 1024.log2
10

>>> 1000.log10
3
```

## Trigonometric Functions

`sin`, `cos`, `tan`, asin=`arcSin`, acos=`arcCos`, atan=`arcTan`, `atan2`, sinpi, cospi, tanpi

```
>>> 0.sin
0

>>> atan2(1, 1)
1/4.pi
```

## Hyperbolic Functions

`sinh`, `cosh`, `tanh`, asinh=`arcSinh`, acosh=`arcCosh`, atanh=`arcTanh`

## Special Functions

`erf`, `erfc`, tgamma=`gamma`, lgamma=`logGamma`

```
>>> 5.gamma
4.!

>>> 0.erf
0
```

## Float Utilities

copysign=`copySign`, nextafter, isNan=`isNaN`, isInf, `isFinite`, isNormal

```
>>> isNaN(0 / 0)
true

>>> isFinite(1 / 0)
false

>>> 42.isFinite
true
```

## Bit Manipulation Functions

Bit counting:
clz=`countLeadingZeroes`, clo, ctz, cto, popCount=`bitCount`

```
>>> 1.countLeadingZeroes(2, 64)
63

>>> 16rFF.bitCount
8
```

Bit rotation:
rotl=`bitRotateLeft`, rotr=`bitRotateRight`

Power-of-two utilities:
bitCeil=`nextPowerOfTwo`, bitFloor=`previousPowerOfTwo`, bitWidth, hasSingleBit

```
>>> 5.nextPowerOfTwo
8

>>> 5.previousPowerOfTwo
4

>>> 8.bitCount = 1
true

>>> 6.bitCount = 1
false
```

## Complex Number Functions

`Complex`

```
>>> Complex(3, 4)
3 + 4I

>>> Complex(1, 0)
1 + 0I
```

`real`, imag=`imaginary`, `abs`, norm=`squaredNorm`, conj=`conjugate`, `arg`, polar

```
>>> let z = 3+4I;
>>> (
>>> 	z.real,
>>> 	z.imaginary,
>>> 	z.abs,
>>> 	z.squaredNorm,
>>> 	z.conjugate,
>>> 	z.arg
>>> )
(3, 4, 5, 25, 3-4I, 0.927295)
```

## Fraction Functions

numer=`numerator`, denom=`denominator`

```
>>> numerator(7/2)
7

>>> denominator(7/2)
2

>>> numerator(4/6)
2

>>> denominator(4/6)
3

>>> numerator(6 / -8L)
-3

>>> denominator(6 / -8L)
4

>>> denominator(10/5)
1
```

## String Functions

length=`size`, `min`, `max`, cmp=`compare`, `<`, `=`, `>`

```
>>> 'hello'.size
5

>>> ''.size
0

>>> min('apple', 'banana')
'apple'

>>> max('apple', 'banana')
'banana'

>>> compare('apple', 'banana')
-1

>>> 'abc' < 'abd'
true
```

`isEmpty`, substring=`copyFromTo`, contains=`includesSubstring`, startsWith, endsWith, split, trim, toUpper, toLower, replace, indexOf, lastIndexOf, parseInt, parseFloat, codePoints, indexing, toSymbol

```
>>> copyFromTo('hello world', 1, 5)
'hello'

>>> copyFromTo('hello world', 7, 11)
'world'

>>> copyFromTo('abcdef', 3, 5)
'cde'

>>> includesSubstring('hello world', 'world')
true

>>> includesSubstring('hello world', 'xyz')
false

>>> includesSubstring('abc', '')
true
```
