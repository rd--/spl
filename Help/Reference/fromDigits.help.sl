# fromDigits

- _fromDigits([x₁ x₂ …], b)_

Constructs an integer from the sequence _x_ of digits in radix _b_.

Construct a number from its base-10 digits:

```
>>> [5 1 2 8].fromDigits(10)
5128
```

Base-2 digits:

```
>>> [1 0 1 1 0 1 1].fromDigits(2)
91
```

Digits larger than the base are "carried":

```
>>> [7 11 0 0 0 122].fromDigits(10)
810122
```

Calculate the first few decimal Smarandache–Wellin numbers,
c.f. OEIS [A019518](https://oeis.org/A019518):

```
>>> 1:9.collect { :n |
>>> 	n.primesList.collect(
>>> 		integerDigits:/1
>>> 	).flatten.fromDigits(10)
>>> }
[
	2
	23
	235
	2357
	235711
	23571113
	2357111317
	235711131719
	23571113171923
]
```

If _b_ is a large integer, so is the answer:

```
>>> [1 2 3].fromDigits(10L)
123L
```

* * *

See also: digitCount, fromContinuedFraction, integerDigits, powerRange, rationalize

Guides: Bitwise Functions, Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDigits.html)

Categories: Converting
