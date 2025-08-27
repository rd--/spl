# composeRight

- _composeRight(aBlock:/1, anotherBlock:/1)_

Compose the two unary Blocks _aBlock_ and _anotherBlock_ into one unary Block.

The blocks are composed left to right,
i.e. _aBlock_ is applied first and _anotherBlock_ second.

```
>>> -.bindLeft(3).composeRight(^.bindLeft(7)) . (5)
(7 ^ (3 - 5))

>>> -.bindRight(3).composeRight(^.bindRight(7)) . (5)
((5 - 3) ^ 7)
```

Composition of inverses:

```
>>> let n = system.nextRandomFloat;
>>> square:/1.composeRight(sqrt:/1) . (n)
n
```

* * *

See also: bindRight, bindRight, composeLeft

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RightComposition.html)
