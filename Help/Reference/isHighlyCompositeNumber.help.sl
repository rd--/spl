# isHighlyCompositeNumber

- _isHighlyCompositeNumber(n)_

Determine if the integer _n_ is a highly composite number.

The first few highly composite numbers,
OEIS [A002182](http://oeis.org/A002182):

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

Number of divisors of succesive highly composite numbers,
OEIS [A002183](https://oeis.org/A002183):

```
>>> [
>>> 	1 2 4 6 12 24 36 48 60 120
>>> 	180 240 360 720 840
>>> ].collect { :n |
>>> 	0.divisorSigma(n)
>>> }
[1 2 3 4 6 8 9 10 12 16 18 20 24 30 32]
```

* * *

See also: divisors, isComposite

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HighlyCompositeNumber.html),
_OEIS_
[1](http://oeis.org/A002182)
[2](http://oeis.org/A002183),
_W_
[1](https://en.wikipedia.org/wiki/Highly_composite_number)

Categories: Arithmetic
