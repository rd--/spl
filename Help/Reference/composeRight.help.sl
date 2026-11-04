# composeRight

- _composeRight(f/1, g/1)_

Compose the two unary Blocks _f_ and _g_ into one unary Block.

The blocks are composed left to right,
i.e. _f_ is applied first and _g_ second.

```
>>> let f/1 = -.bindLeft(3)
>>> .composeRight(
>>> 	^.bindLeft(7)
>>> );
>>> f(5)
(7 ^ (3 - 5))

>>> let f/1 = -.bindRight(3)
>>> .composeRight(
>>> 	^.bindRight(7)
>>> );
>>> f(5)
((5 - 3) ^ 7)
```

Composition of inverses:

```
>>> let n = system.nextRandomFloat;
>>> let f/1 = square/1.composeRight(sqrt/1);
>>> f(n)
n
```

* * *

See also: bindRight, bindRight, composeLeft

Guides: Block Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RightComposition.html)
