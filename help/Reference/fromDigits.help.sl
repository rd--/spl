# fromDigits

- _fromDigits(aSequence, anInteger)_

Constructs an integer from _aSequence_ of digits in radix _anInteger_.

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

* * *

See also: digitCount, fromContinuedFraction, integerDigits, powerRange, rationalize

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromDigits.html)
