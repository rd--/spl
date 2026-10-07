# isInteger

- _isInteger(x, ε)_

Answers `true` if the number _x_ is an `Integer`, else `false`.

At `SmallFloat`:

```
>>> 23.isInteger
true

>>> 3.141.isInteger
false

>>> Infinity.isInteger
false
```

At `SmallFloat`,
values that are integers but not small integers answer `false`,
see also `isIeeeInteger`:

```
>>> 1E50.isInteger
false

>>> 1E50.isIeeeInteger
true
```

The binary form allows as ε value to be specified:

```
>>> 1.000001.isInteger(1E-6)
true

>>> 1:750.select { :n |
>>> 	(n ^ (1 / 3)).isInteger(1E-14)
>>> }
[1 8 27 64 125 216 343 512 729]

>>> 1:9 ^ 3
[1 8 27 64 125 216 343 512 729]
```

Note that numbers written using floating point literal notation,
where the fractional part is zero,
answer `true`:

```
>>> 23.0.isInteger
true
```

At `LargeInteger`:

```
>>> 23L.isInteger
true
```

At `Fraction`:

```
>>> 2/3.isInteger
false

>>> 2/2.isInteger
true

>>> (1/3 * 3).isInteger
true
```

At `Decimal` is not `true` unless `scale` is `zero`:

```
>>> 3.141D.isInteger
false

>>> 3.000D.isInteger
false

>>> 3D.isInteger
true
```

At `Residue`:

```
>>> 5Z12.isInteger
true
```

At `Complex` answers `false`, see `isGaussianInteger`:

```
>>> 2J3.isInteger
false
```

A `List` is not an integer:

```
>>> [1 2 3].isInteger
false

>>> [1 2 3].allTrue(isInteger/1)
true
```

Test whether a rank-two array consists of all integers:

```
>>> [
>>> 	1 2 3;
>>> 	4 5 6;
>>> 	7 8 9
>>> ].isIntegerArray
true
```

Characteristic function of multiples of three,
OEIS [A079978](https://oeis.org/A079978),
essentially the same as the decimal expansion of _1/999_,
OEIS [A022003](https://oeis.org/A022003):

```
>>> (0:21 / 3).collect(isInteger/1).boole
[1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1]

>>> Decimal(1/999, 33)
0.001001001001001001001001001001001D

>>> Decimal(1000/999, 33)
1.001001001001001001001001001001001D
```

Characteristic function of multiples of four,
OEIS [A121262](https://oeis.org/A121262):

```
>>> (0:20 / 4).collect(isInteger/1).boole
[1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 1]
```

Largest integer _m_ such that _n-m^2_ is a square,
or zero if no such _m_ exists,
OEIS [A133388](https://oeis.org/A133388):

~~~spl svg=A oeis=A133388
1:100.collect { :n |
	let m = 0;
	let x = 0;
	{ :break/0 |
		let d = n - m.square;
		(d < 0).if {
			break()
		} {
			let s = d.sqrt;
			s.isInteger.ifTrue {
				x := s;
				break()
			}
		};
		m := m + 1
	}.repeatForeverWithBreak;
	x
}.discretePlot
~~~

![](Help/Image/isInteger-A.svg)

The characteristic function of the cubic numbers,
one if _n_ is a cube else zero,
OEIS [A010057](https://oeis.org/A010057):

~~~spl svg=B oeis=A010057
1:750.collect { :n |
	(n ^ (1 / 3)).isInteger(1E-14)
}.boole.discretePlot
~~~

![](Help/Image/isInteger-B.svg)

Least integer obtained when _n_ is divided by succesive primes,
stopping as soon as one of the primes does not divide it,
OEIS [A111701](https://oeis.org/A111701):

~~~spl svg=C oeis=A111701
1:85.collect { :n |
	let m = n;
	let k = 1;
	{
		(m / k.prime).isInteger
	}.whileTrue {
		m := m / k.prime;
		k := k + 1
	};
	m
}.discretePlot
~~~

![](Help/Image/isInteger-C.svg)

Greatest primorial number which divides _n_,
OEIS [A053589](https://oeis.org/A053589):

~~~spl svg=D oeis=A053589
1:85.collect { :n |
	let k = 1;
	{
		(n / k.primorial).isInteger
	}.whileTrue {
		k := k + 1
	};
	(k - 1).primorial
}.discretePlot
~~~

![](Help/Image/isInteger-D.svg)

Smallest integer of the form _n/k!_,
OEIS [A076934](https://oeis.org/A076934):

~~~spl svg=E oeis=A076934
1:85.collect { :n |
	let k = 1;
	{
		(n / k.factorial).isInteger
	}.whileTrue {
		k := k + 1
	};
	n / (k - 1).factorial
}.discretePlot
~~~

![](Help/Image/isInteger-E.svg)

Rotated binary decrementing,
OEIS [A153151](https://oeis.org/A153151):

~~~spl svg=F oeis=A153151
0:70.collect { :n |
	(n < 2).if {
		n
	} {
		n.log(2).isInteger.if {
			2 * n - 1
		} {
			n - 1
		}
	}
}.discretePlot
~~~

![](Help/Image/isInteger-F.svg)

_Rationale_:
Note that this is not a `Type` predicate,
it tests a property of a specific instance of a number.
`Fraction`, `SmallFloat` and `Decimal` values may each possibly represent an integer.
In this sense it is like `isEven` and `isOdd`,
however it unlike in that it is defined to be false for non number values.
The type predicates are `isFraction`, `isSmallFloat`, `isDecimal`, `isLargeInteger`.

* * *

See also: Integer, Number, isFraction, isNumber, isGaussianInteger, isLargeInteger, isSmallFloat, isSmallInteger, parseLargeInteger, parseSmallInteger

Guides: Integer Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Integer.html)
[2](https://mathworld.wolfram.com/AlmostInteger.html)
[3](https://reference.wolfram.com/language/ref/IntegerQ.html),
_W_
[1](https://en.wikipedia.org/wiki/Integer)

Categories: Testing, Math
