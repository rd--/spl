# isCyclicGrayCode

- _isCyclicGrayCode([x₁ x₂ …])_

Answer `true` if the sequence of bit-vectors _x_ is a cyclic Gray code, else `false`.

The 1-bit cyclic Gray code:

```
>>> [0; 1].isCyclicGrayCode
true
```

Two 2-bit cyclic Gray codes:

```
>>> [0 0; 0 1; 1 1; 1 0]
>>> .isCyclicGrayCode
true

>>> [0 0; 1 0; 1 1; 0 1]
>>> .isCyclicGrayCode
true
```

A 3-bit cyclic Gray code:

```
>>> [
>>> 	0 0 0; 0 0 1; 0 1 1; 0 1 0;
>>> 	1 1 0; 1 1 1; 1 0 1; 1 0 0
>>> ].isCyclicGrayCode
true
```

A 4-bit cyclic Gray code:

```
>>> [
>>> 	0 0 0 0; 1 0 0 0; 1 1 0 0; 1 1 1 0;
>>> 	1 1 1 1; 1 1 0 1; 0 1 0 1; 0 0 0 1;
>>> 	1 0 0 1; 1 0 1 1; 1 0 1 0; 0 0 1 0;
>>> 	0 0 1 1; 0 1 1 1; 0 1 1 0; 0 1 0 0
>>> ].isCyclicGrayCode
true
```

A 5-bit cyclic Gray code:

```
>>> [
>>> 	0 0 0 0 0; 0 0 0 0 1; 0 0 0 1 1;
>>> 	0 0 0 1 0; 0 0 1 1 0; 0 0 1 1 1;
>>> 	0 0 1 0 1; 0 0 1 0 0; 0 1 1 0 0;
>>> 	0 1 1 0 1; 0 1 1 1 1; 0 1 1 1 0;
>>> 	0 1 0 1 0; 0 1 0 1 1; 0 1 0 0 1;
>>> 	0 1 0 0 0; 1 1 0 0 0; 1 1 0 0 1;
>>> 	1 1 0 1 1; 1 1 0 1 0; 1 1 1 1 0;
>>> 	1 1 1 1 1; 1 1 1 0 1; 1 1 1 0 0;
>>> 	1 0 1 0 0; 1 0 1 0 1; 1 0 1 1 1;
>>> 	1 0 1 1 0; 1 0 0 1 0; 1 0 0 1 1;
>>> 	1 0 0 0 1; 1 0 0 0 0
>>> ].isCyclicGrayCode
true
```

* * *

See also: grayDecode, grayEncode, isBeckettGrayCode, isBitVector, isGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
