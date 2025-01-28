# Fraction

- _Fraction(numerator, denominator)_

`Fraction` is a numerical `Type` that provides methods for working with fractions like 1/3 as a ratio of two integers.

Instance variables are:

- `numerator`: the number appearing before the fraction bar (above)
- `denominator`: the number appearing after the fraction bar (below)

A Fraction can be written using the literal syntax _1/3_:

```
>>> 1/3
Fraction(1, 3)
```

Fractions can be converted to floating point numbers:

```
>>> 3/4.asSmallFloat
0.75
```

Fractions and floats are comparable:

```
>>> 3/4 ~ 0.75
true

>>> 7/6 > 1.1
true
```

Fractions written using a literal syntax are `simplified` by construction:

```
>>> 2/4
1/2
```

The `Fraction` method reduces fractions on construction:

```
>>> Fraction(2, 4)
1/2
```

The `ReducedFraction` method does not, it assumes the fraction being specified is in reduced form:

```
>>> ReducedFraction(2, 4).asTuple
(2, 4)
```

Literal fractions are `normalized` and have the following invariants:

- the denominator shall always be positive
- the numerator and denominator shall never have common multiples

Properly simplified fractions have the additional invariant:

- the denominator shall allways be greater than 1

For instance:

```
>>> Fraction(3, -2)
Fraction(-3, 2)

>>> Fraction(2, 1).simplified
2

>>> 8/6
Fraction(4, 3)
```

A Fraction that does not conform to the above invariants could be the cause of undefined behavior and unexpected results.

The message `normalized` obtains a normal Fraction.
The message `reduced` obtains a normal Fraction or an Integer.

Note that `Fraction` and `Integer` represent together the set of Rational numbers:

- Integer is a subset of rational (those which are whole numbers)
- Fraction is used for representing the complementary subset of rational (those which are not whole numbers)

`LargeInteger` defines `/` to answer a `Fraction`:

```
>>> 2n / 3n
2/3
```

`Fraction` implements the ordinary mathematical operators:

```
>>> 2/3 + 4/3
2

>>> 2/3 * 3/4
1/2

>>> 5/3 - 1/2
7/6

>>> 2/3 ^ 5
32/243

>>> 64/63 * (9/8 ^ 2)
9/7

>>> 5/4 ^ 3/1
125/64
```

Operands may be collections:

```
>>> 5/4 * 3:7
[15/4 5/1 25/4 15/2 35/4]

>>> 5/4 / 3:7
[5/12 5/16 1/4 5/24 5/28]

>>> 5/4 ^ 3:7
[
	125/64 625/256 3125/1024
	15625/4096 78125/16384
]
```

A `Fraction` whose elements are of type `SmallFloat` will have odd behaviour for large components,
a `Fraction` whose elements are of type `LargeInteger` will behave ordinarily.

```
>>> let x = Fraction(2 ^ 55, 2);
>>> x ~= (x - 1)
false

>>> let x = Fraction(2n ^ 55n, 2);
>>> x ~= (x - 1)
true
```

There are accessor methods for the `numerator` and `denominator`:

```
>>> let n = 22/7;
>>> (n.numerator, n.denominator)
(22, 7)
```

The `asTuple` method answers a two tuple of these:

```
>>> 22/7.asTuple
(22, 7)
```

The letter _r_ abbreviates _Fraction_ (_r_ for _rational_), in the same manner that _j_ abbreviates _Complex_.

```
>>> 3.r(7)
3/7

>>> 3.j(7)
3J7
```

Written using `Infix Method Syntax` this provides a concise notation for writing Fractions with `LargeInteger` parts:

```
>>> (2n r: 3n).asTuple
(2n, 3n)
```

Enter a rational number with very big integers in the numerator and denominator:

```
>>> let n = 1237918739182739817238917127398123n;
>>> let d = 12809812308120812038038101n;
>>> let r = Fraction(n, d);
>>> (r.numerator, r.denominator)
(
	1237918739182739817238917127398123n,
	12809812308120812038038101n
)
```

Rational numbers are represented with the smallest possible positive denominator:

```
>>> 7/49
1/7
```

The store string of a Fraction is the constructor notation:

```
>>> 22/7.storeString
'Fraction(22, 7)'
```

The reciprocal of a `Fraction` is a `Fraction`:

```
>>> 22/7./
7/22
```

This is a close approximation to 2.sqrt:

```
>>> let f = { :r |
>>> 	let [x, y] = r.asTuple;
>>> 	(x ^ 2 + (2 * (y ^ 2))).r(2 * x * y)
>>> };
>>> (
>>> 	f:/1.iterate(3/2, 4),
>>> 	f:/1.iterate(3n r: 2n, 5)
>>> )
(
	Fraction(
		886731088897,
		627013566048
	),
	Fraction(
		1572584048032918633353217n,
		1111984844349868137938112n
	)
)

>>> 886731088897 / 627013566048
2.sqrt
```

Fractions are numbers:

```
>>> 3/4.isNumber
true
```

Fractions are not immediate:

```
>>> 3/4.isImmediate
false
```

The denominator of a rational is positive:

```
>>> -3/4.denominator
4
```

The numerator and denominator of a rational are relatively prime:

```
>>> let x = system.nextRandomFloat;
>>> let r = x.asFraction;
>>> r.numerator.gcd(r.denominator)
1
```

`Fraction` threads over lists:

```
>>> Fraction([1 3 5], [3 5 7])
[1/3 3/5 5/7]
```

A `Fraction` multiplied by a `SmallFloat`,
and vice-versa,
answers a `SmallFloat`:

```
>>> 1/3 * 0.333
0.111

>>> 0.333 * 1/3
0.111
```

Convert degrees/minutes/seconds to precise rational representation:

```
>>> 57 + 45/60 + 17/3600
207917/3600
```

* * *

See also: denominator, normalized, numerator, ReducedFraction, reduced

Guides: Fraction Literals

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#t:Rational),
_Mathematica_
[1](https://mathworld.wolfram.com/Fraction.html)
[2](https://reference.wolfram.com/language/ref/Rational.html),
_Smalltalk_
5.6.9.1

Categories: Arithmetic, Math
