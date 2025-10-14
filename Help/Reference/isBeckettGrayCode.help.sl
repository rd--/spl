# isBeckettGrayCode

- _isBeckettGrayCode([x₁ x₂ …])_

Answer `true` if the sequence of bit-vectors _x_ is a Beckett-Gray code, else `false`.

A Beckett-Gray code is a special kind of cyclic Gray code where
the first pattern is all zeros,
and whenever a bit transitions _1→0_ it is the bit which has been _1_ longest.

The 1-bit Beckett-Gray code:

```
>>> [0; 1]
>>> .isBeckettGrayCode
true
```

Two 2-bit Beckett-Gray codes:

```
>>> [0 0; 0 1; 1 1; 1 0]
>>> .isBeckettGrayCode
true

>>> [0 0; 1 0; 1 1; 0 1]
>>> .isBeckettGrayCode
true
```

There are no 3-bit or 4-bit Beckett-Gray codes.
Two 5-bit Beckett-Gray codes:

```
>>> [
>>> 	0 0 0 0 0; 0 0 0 0 1; 0 0 0 1 1;
>>> 	0 0 0 1 0; 0 0 1 1 0; 0 0 1 1 1;
>>> 	0 0 1 0 1; 0 1 1 0 1; 0 1 0 0 1;
>>> 	0 1 0 0 0; 0 1 0 1 0; 0 1 0 1 1;
>>> 	1 1 0 1 1; 1 0 0 1 1; 1 0 1 1 1;
>>> 	1 0 1 0 1; 1 0 1 0 0; 0 0 1 0 0;
>>> 	0 1 1 0 0; 1 1 1 0 0; 1 1 0 0 0;
>>> 	1 1 0 1 0; 1 0 0 1 0; 1 0 1 1 0;
>>> 	1 1 1 1 0; 0 1 1 1 0; 0 1 1 1 1;
>>> 	1 1 1 1 1; 1 1 1 0 1; 1 1 0 0 1;
>>> 	1 0 0 0 1; 1 0 0 0 0
>>> ].isBeckettGrayCode
true

>>> [
>>> 	0 0 0 0 0; 0 1 0 0 0; 0 1 0 0 1;
>>> 	0 0 0 0 1; 0 0 0 1 1; 0 1 0 1 1;
>>> 	0 1 0 1 0; 1 1 0 1 0; 1 1 0 0 0;
>>> 	1 0 0 0 0; 1 0 0 0 1; 1 1 0 0 1;
>>> 	1 1 1 0 1; 0 1 1 0 1; 0 1 1 1 1;
>>> 	0 1 1 1 0; 0 0 1 1 0; 0 0 0 1 0;
>>> 	1 0 0 1 0; 1 0 1 1 0; 1 0 1 0 0;
>>> 	1 0 1 0 1; 0 0 1 0 1; 0 0 1 1 1;
>>> 	1 0 1 1 1; 1 0 0 1 1; 1 1 0 1 1;
>>> 	1 1 1 1 1; 1 1 1 1 0; 1 1 1 0 0;
>>> 	0 1 1 0 0; 0 0 1 0 0
>>> ].isBeckettGrayCode
true
```

* * *

See also: grayDecode, grayEncode, isBitVector, isCyclicGrayCode, isGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)

Further Reading: Cooke 2025, Sawada 2007
