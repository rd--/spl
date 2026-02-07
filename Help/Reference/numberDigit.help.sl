# numberDigit

- _numberDigit(x, n, b)_

Answer the digit corresponding to _b^n_ in the real-valued number _x_.

Find the digit corresponding to _10^2_ in a number:

```
>>> 123456.numberDigit(2, 10)
4
```

Find the _10^4_ and _10^6_ digits of a number:

```
>>> [4 6].collect { :n |
>>> 	123456789.numberDigit(n, 10)
>>> }
[5 3]
```

Find the _10^{3,5,7}_ digits of a number,
threads over lists:

```
>>> 9876543210.numberDigit([3 5 7], 10)
[3 5 7]
```

Digits of negative numbers are the same as for their positive counterparts:

```
>>> -123456789.numberDigit([2 4 6], 10)
[7 5 3]
```

* * *

See also: integerDigits

Guides: Integer Functions, Number Digit Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumberDigit.html)
