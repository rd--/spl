# isGrayCode

- _isGrayCode([x₁ x₂ …], kind)_

Answer `true` if the sequence of vectors _x_ is a Gray code of the specified kind,
else `false`.

A 3-bit non-cyclic binary Gray code:

```
>>> [
>>> 	0 0 0;
>>> 	0 0 1;
>>> 	0 1 1;
>>> 	0 1 0;
>>> 	1 1 0;
>>> 	1 0 0;
>>> 	1 0 1;
>>> 	1 1 1
>>> ].isGrayCode('Binary')
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
