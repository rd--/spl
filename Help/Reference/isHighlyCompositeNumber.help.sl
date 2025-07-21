# isHighlyCompositeNumber

- _isHighlyCompositeNumber(n)_

Determine if the integer _n_ is a highly composite number.

The first few highly composite numbers:

```
>>> 1:240.select(
>>> 	isHighlyCompositeNumber:/1
>>> )
[
	  1   2   4   6  12
	 24  36  48  60 120
	180 240
]
```

Seven factorial is the nineteenth highly composite number:

```
>>> 5040.isHighlyCompositeNumber
true
```

* * *

See also: divisors, isComposite

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HighlyCompositeNumber.html),
_OEIS_
[1](http://oeis.org/A002182),
_W_
[1](https://en.wikipedia.org/wiki/Highly_composite_number)

Categories: Arithmetic
