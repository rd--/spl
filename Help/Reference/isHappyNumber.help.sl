# isHappyNumber

- _isHappyNumber(n)_

Answer `true` if the positive integer _n_ is a happy number.

```
>>> 7.isHappyNumber
true

>>> 7.perfectDigitalInvariantSequence(10, 2)
[7 49 97 130 10 1]
```

The first few happy numbers:

```
>>> 1:100.select(isHappyNumber:/1)
[
	 1   7  10  13  19  23  28  31  32  44
	49  68  70  79  82  86  91  94  97 100
]
```

The number of iterations required to reach `one`:

```
>>> 1:100.select(
>>> 	isHappyNumber:/1
>>> ).collect { :x |
>>> 	x.perfectDigitalInvariantSequence(
>>> 		10, 2
>>> 	).size - 1
>>> }
[0 5 1 2 4 3 3 2 3 4 4 2 5 3 3 2 4 4 3 1]
```

The first few happy primes:

```
>>> 1:150.select { :x |
>>> 	x.isHappyNumber & {
>>> 		x.isPrime
>>> 	}
>>> }
[7 13 19 23 31 79 97 103 109 139]
```

* * *

See also: isUnhappyNumber, perfectDigitalInvariantSequence

Guides: Integer Sequences

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HappyNumber.html),
_W_
[1](https://en.wikipedia.org/wiki/Happy_number)
