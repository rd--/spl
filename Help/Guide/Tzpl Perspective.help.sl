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

length=`size`, `min`, `max`, cmp=`compare`, `<`, `=`, `>`:

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

substring=`copyFromTo`:

```
>>> copyFromTo('hello world', 1, 5)
'hello'

>>> copyFromTo('hello world', 7, 11)
'world'

>>> copyFromTo('abcdef', 3, 5)
'cde'
```

contains=`includesSubstring`:

```
>>> includesSubstring('hello world', 'world')
true

>>> includesSubstring('hello world', 'xyz')
false

>>> includesSubstring('abc', '')
true
```

startsWith=`beginsWith`:

```
>>> beginsWith('hello world', 'hello')
true

>>> beginsWith('hello world', 'world')
false
```

`endsWith`:

```
>>> endsWith('hello world', 'world')
true

>>> endsWith('hello world', 'hello')
false
```

split=`splitBy`:

```
>>> splitBy('a,b,c', ',')
['a', 'b', 'c']

>>> splitBy('one--two--three', '--')
['one', 'two', 'three']

>>> splitBy('hello', '')
['h', 'e', 'l', 'l', 'o']
```

`trim`:

```
>>> trim('  hello  ')
'hello'

>>> trim('  leading')
'leading'

>>> trim('trailing  ')
'trailing'
```

toUpper=`asUpperCase`, toLower=`asLowerCase`

```
>>> asUpperCase('hello')
'HELLO'

>>> asLowerCase('HELLO')
'hello'

>>> asUpperCase('Hello World')
'HELLO WORLD'

>>> asLowerCase('Hello World')
'hello world'
```

replace=`stringReplace`:

```
>>> stringReplace('hello world', 'world' -> 'there')
'hello there'

>>> stringReplace('aabbcc', 'bb' -> 'XX')
'aaXXcc'

>>> stringReplace('abcabc', 'abc' -> 'x')
'xx'
```

indexOf=`indexOfSubstring`, lastIndexOf=`lastIndexOfSubstring`

```
>>> indexOfSubstring('hello world', 'world')
7

>>> indexOfSubstring('hello', 'xyz')
0

>>> lastIndexOfSubstring('abcabc', 'bc')
5

>>> let s = 'key=value';
>>> let i = s.indexOfSubstring('=');
>>> s.copyFromTo(i + 1, s.size)
'value'
```

parseInt(s) / parseInt(s, radix) / parseFloat(s)
Strict string-to-number parsing that can report failure (unlike the toInt/toFloat conversions, which only accept values that are already numbers). The whole string must be a valid number — no surrounding whitespace, no trailing characters. Returns Option.none on any malformed input, including integer overflow.

```
>>> parseSmallInteger('42', 10)
42

>>> parseSmallInteger('-17', 10)
-17

>>> parseSmallInteger('12x', 10, { })
nil

>>> parseSmallInteger(' 12', 10, { })
nil

>>> parseSmallInteger('ff', 16)
255

>>> parseSmallInteger('101', 2)
5

>>> parseNumber('3.5')
3.5

>>> parseNumber('1e3')
1000

>>> parseNumber('nope', { 0 })
0
```

`codePoints`:

```
>>> codePoints('ABC')
[65 66 67]

>>> codePoints('')
[]

>>> codePoints('Z')
[90]

>>> codePoints('\u00e9')
[233]

>>> codePoints('\u20ac')
[8364]

>>> codePoints('hello').take(3)
[104 101 108]
```

`at`:

```
>>> let s = 'hello';
>>> (s[1], s[2], s[4])
('h', 'e', 'l')
```

## String Formatting

fmt=`format`:

```
>>> '% + % = %'.format([1, 2, 3])
'1 + 2 = 3'
```

## Range Functions

length=`size`, toArray=`List`:

```
>>> (1 .. 5).size
5

>>> (1 .. 5).List
[1 2 3 4 5]

>>> (1 .. 5).Stream.next
1
```

## Collection Functions

length=`size`:

```
>>> [1 2 3 4 5].size
5

>>> Stream[1 2 3].size
3
```

`isEmpty`:

```
>>> [].isEmpty
true

>>> [1 2 3].isEmpty
false

>>> (1 .. Infinity).isEmpty
false
```

`take`:

```
>>> [1 2 3 4 5].take(3)
[1 2 3]

>>> Stream[1 2 3 4 5]
>>> .take(3)
>>> .next
1
```

`drop`:

```
>>> [1 2 3 4 5].drop(2)
[3 4 5]

>>> Stream[1 2 3 4 5]
>>> .drop(2)
>>> .next
3
```

`takeWhile`:

```
>>> [1 2 3 4 5].takeWhile { :x | x < 4 }
[1 2 3]
```

`dropWhile`:

```
>>> [1 2 3 4 5].dropWhile { :x | x < 4 }
[4 5]
```

## Type Conversions

toInt=`truncate`:

```
>>> truncate(3.7)
3

>>> truncate(-2.9)
-2

>>> truncate(7/2)
3
```

toFloat=`Float`, `real`:

```
>>> Float(5)
5

>>> Float(7/2)
3.5

>>> real(3 + 4I)
3
```

toFraction=`Fraction`:

```
>>> Fraction(5)
5/1
```

toComplex=`Complex`:

```
>>> Complex(5)
5J0

>>> Complex(3.14)
3.14J0

>>> Complex(7/2)
3.5J0
```

* * *

References:
_Tzpl_
[1](https://lfnoise.github.io/tzpl/Builtin_Functions.html)
