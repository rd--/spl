# isGrayCode

- _isGrayCode([x₁ x₂ …])_

Answer `true` if the sequence of bit-vectors _x_ is a Gray code, else `false`.

A 3-bit non-cyclic Gray code:

```
>>> [
>>> 	0 0 0; 0 0 1; 0 1 1; 0 1 0;
>>> 	1 1 0; 1 0 0; 1 0 1; 1 1 1
>>> ].isGrayCode
true
```

* * *

See also: grayDecode, grayEncode, isBeckettGrayCode, isBitVector, isCyclicGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
