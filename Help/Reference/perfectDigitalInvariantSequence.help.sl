# perfectDigitalInvariantSequence

- _perfectDigitalInvariantSequence(x, b=10, p=2)_

Answer the sequence of terms given by iterating the perfect digital invariant function.

```
>>> 7.perfectDigitalInvariantSequence(
>>> 	10, 2
>>> )
[7 49 97 130 10 1]

>>> 55.perfectDigitalInvariantSequence(
>>> 	10, 3
>>> )
[55 250 133]
```

The predicate `isPerfectDigitalInvariant` is `true` if the sequence has only one place:

```
>>> 4150.perfectDigitalInvariantSequence(
>>> 	10, 5
>>> )
[4150]

>>> 4150.isPerfectDigitalInvariant(10, 5)
true
```

Perfect digital invariant where _p=3_:

```
>>> [153 370 371 407].collect { :each |
>>> 	each
>>> 	.perfectDigitalInvariantSequence(
>>> 		10, 3
>>> 	)
>>> }
[153; 370; 371; 407]
```

The sequence lengths for the first few terms of the _p=2_ sequences:

```
>>> 1:70.collect { :each |
>>> 	each
>>> 	.perfectDigitalInvariantSequence(
>>> 		10, 2
>>> 	).size
>>> }
[
	 1  9 13  8 12 17  6 13 12  2
	10 13  3 14 11  8 13 11  5  8
	13 14  4  9 11 10 14  4 10 13
	 3  4 12 12 13 16  8 10 13  9
	14  8 12  5 15 12 11 14  5 12
	11 11 13 15 13 10 12  8 10 17
	 9 10 16 12 10 15 10  3 13  6
]
```

* * *

See also: isHappyNumber

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A046197)
[2](https://oeis.org/A193995)
_W_
[1](https://en.wikipedia.org/wiki/Perfect_digital_invariant)
