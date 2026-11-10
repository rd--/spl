# isIntegerValuedNumber

- _isIntegerValuedNumber(x)_

Answer `true` if _x_ is a real valued number,
else `false`.

At `Integer`:

```
>>> 23L.isIntegerValuedNumber
true
```

At `Float`:

```
>>> 23.0.isIntegerValuedNumber
true

>>> 3.141.isIntegerValuedNumber
false
```

Infinity is not an integer:

```
>>> Infinity.isIntegerValuedNumber
false
```

Not-a-number is not an integer:

```
>>> NaN.isIntegerValuedNumber
false
```

At `Float`,
values that are integers but not small integers answer `false`,
see also `isIeeeInteger`:

```
>>> 1E50.isIntegerValuedNumber
false

>>> 1E50.isIeeeInteger
true
```

At `Fraction`:

```
>>> 1/3.isIntegerValuedNumber
false

>>> 3/1.isIntegerValuedNumber
true

>>> (1/3 * 3).isIntegerValuedNumber
true

>>> 0/1.isIntegerValuedNumber
true
```

At `Complex`:

```
>>> 1J2.isIntegerValuedNumber
false

>>> 1J0.isIntegerValuedNumber
false
```

At `Decimal`,
may be an integer even if `scale` is not `zero`:

```
>>> 3D.isIntegerValuedNumber
true

>>> 3.141D.isIntegerValuedNumber
false

>>> 3.000D.isIntegerValuedNumber
true
```

At `Residue`:

```
>>> 5Z12.isIntegerValuedNumber
true
```

At `Complex` answers `false`, see `isGaussianInteger`:

```
>>> 2J3.isIntegerValuedNumber
false
```

A `List` is not an integer:

```
>>> {
>>> 	[1 2 3].isIntegerValuedNumber
>>> }.hasError
false

>>> [1 2 3].allTrue(isIntegerValuedNumber/1)
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
>>> (0:21 / 3).collect(
>>> 	isIntegerValuedNumber/1
>>> ).boole
[1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1 0 0 1]

>>> Decimal(1/999, 33)
0.001001001001001001001001001001001D

>>> Decimal(1000/999, 33)
1.001001001001001001001001001001001D
```

Characteristic function of multiples of four,
OEIS [A121262](https://oeis.org/A121262):

```
>>> (0:20 / 4).collect(
>>> 	isIntegerValuedNumber/1
>>> ).boole
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
			s.isIntegerValuedNumber.ifTrue {
				x := s;
				break()
			}
		};
		m := m + 1
	}.repeatForeverWithBreak;
	x
}.discretePlot
~~~

![](Help/Image/isIntegerValuedNumber-A.svg)

Least integer obtained when _n_ is divided by succesive primes,
stopping as soon as one of the primes does not divide it,
OEIS [A111701](https://oeis.org/A111701):

~~~spl svg=B oeis=A111701
1:85.collect { :n |
	let m = n;
	let k = 1;
	{
		(m / k.prime).isIntegerValuedNumber
	}.whileTrue {
		m := m / k.prime;
		k := k + 1
	};
	m
}.discretePlot
~~~

![](Help/Image/isIntegerValuedNumber-B.svg)

Greatest primorial number which divides _n_,
OEIS [A053589](https://oeis.org/A053589):

~~~spl svg=C oeis=A053589
1:85.collect { :n |
	let k = 1;
	{
		(n / k.primorial).isIntegerValuedNumber
	}.whileTrue {
		k := k + 1
	};
	(k - 1).primorial
}.discretePlot
~~~

![](Help/Image/isIntegerValuedNumber-C.svg)

Smallest integer of the form _n/k!_,
OEIS [A076934](https://oeis.org/A076934):

~~~spl svg=D oeis=A076934
1:85.collect { :n |
	let k = 1;
	{
		(n / k.factorial).isIntegerValuedNumber
	}.whileTrue {
		k := k + 1
	};
	n / (k - 1).factorial
}.discretePlot
~~~

![](Help/Image/isIntegerValuedNumber-D.svg)

Rotated binary decrementing,
OEIS [A153151](https://oeis.org/A153151):

~~~spl svg=E oeis=A153151
0:70.collect { :n |
	(n < 2).if {
		n
	} {
		n.log(2).isIntegerValuedNumber.if {
			2 * n - 1
		} {
			n - 1
		}
	}
}.discretePlot
~~~

![](Help/Image/isIntegerValuedNumber-E.svg)

_Rationale_:
Note that this is not a `Type` predicate,
it is a test for a property of a specific instance of a number.
`Fraction`, `Float` and `Decimal` values may each possibly represent an integer.
In this sense it is like `isEven` and `isOdd`,
however it unlike in that it is defined to be false for non number values.
The specific type predicates are `isInteger`, `isFraction`, `isFloat` and `isDecimal`.

* * *

See also: isComplex, isFloat, isFraction, isInteger, isRealValuedNumber

Guides: Predicate Functions
