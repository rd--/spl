# integerReverse

- _integerReverse(n, b=10)_

Reverse the digits of an integer:

```
>>> 123456.integerReverse
654321
```

Reverse the binary digits of an integer:

```
>>> 2015.integerReverse(2)
2015

>>> 2015.integerDigits(2)
>>> .isPalindrome
true

>>> 2015.integerDigits(2)
[1 1 1 1 1 0 1 1 1 1 1]
```

Reverse the digits of an integer after padding it with zeroes on the left:

```
>>> 1234.integerReverse(10, 6)
432100
```

Threads over lists:

```
>>> [123 234 345 456].integerReverse
[321 432 543 654]
```

* * *

See also: bitReversalPermutation, fromDigits, integerDigits, integerLength, isPalindrome, reverse, vanDerCorputNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Reversal.html)
[2](https://reference.wolfram.com/language/ref/IntegerReverse.html)
