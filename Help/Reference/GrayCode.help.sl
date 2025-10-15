# GrayCode

- _GrayCode(n, b=2)_
- _GrayCode([v₁ v₂ …], [a₁ a₂ …])_
- _GrayCode([t₁ t₂ …])_

A `Type` representing a Gray code specified by the list of vectors _v_ over the alphabet _a_,
or by the transition sequence _t_.
If the alphabet is elided it is inferred.

Gray code from bit count:

```
>>> GrayCode(2).sequence
[0 0; 0 1; 1 1; 1 0]
```

Gray code from matrix:

```
>>> GrayCode([0 0; 0 1; 1 1; 1 0])
>>> .transitionSequence
[2 1 2 1]
```

Gray code from transition sequence:

```
>>> GrayCode([2 1 2 1])
>>> .sequence
[0 0; 0 1; 1 1; 1 0]
```

Three-bit Gray code:

```
>>> GrayCode(3).sequence
[
	0 0 0;
	0 0 1;
	0 1 1;
	0 1 0;
	1 1 0;
	1 1 1;
	1 0 1;
	1 0 0
]
```

* * *

See also: grayDecode, grayEncode, isGrayCode

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GrayCode.html),
_W_
[1](https://en.wikipedia.org/wiki/Gray_code)
