# isRepeatingDecimal

- _isRepeatingDecimal(n/d)_

Answer `true` if the `Fraction` _n/d_ is a repeating decimal.
Every rational number is either a terminating or repeating decimal.

First few unit fractions that are repeating:

```
>>> Fraction(1, 1:20)
>>> .select(isRepeatingDecimal:/1)
[
	1/3  1/6  1/7  1/9  1/11
	1/12 1/13 1/14 1/15 1/17
	1/18 1/19
]
```


First few unit fractions that are terminating:

```
>>> Fraction(1, 1:20)
>>> .select(isTerminatingDecimal:/1)
[
	1/1  1/2  1/4  1/5  1/8
	1/10 1/16 1/20
]
```

Denominators of unit fractions having non-terminating decimal expansions,
OEIS [A085837](https://oeis.org/A085837):

```
>>> 1:84.select { :d |
>>> 	(1 \ d).isRepeatingDecimal
>>> }
[
	 3  6  7  9 11 12 13 14 15 17
	18 19 21 22 23 24 26 27 28 29
	30 31 33 34 35 36 37 38 39 41
	42 43 44 45 46 47 48 49 51 52
	53 54 55 56 57 58 59 60 61 62
	63 65 66 67 68 69 70 71 72 73
	74 75 76 77 78 79 81 82 83 84
]
```

* * *

See also: decimalPeriod, Fraction

Guides: Integer Functions

References:
_OEIS_
[1](https://oeis.org/A085837)
