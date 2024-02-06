# composeLeft

_composeLeft(aBlock:/1, anotherBlock:/1)_

Compose the two unary Blocks _aBlock_ and _anotherBlock_ into one unary Block.

The blocks are composed right to left,
i.e. _anotherBlock_ is applied first and _aBlock_ second.

```
>>> -.bindLeft(3).composeLeft(^.bindLeft(7)) . (5)
(3 - (7 ^ 5))

>>> -.bindRight(3).composeLeft(^.bindRight(7)) . (5)
((5 ^ 7) - 3)
```

Composition of inverses:

```
>>> let n = system.nextRandomFloat;
>>> squared:/1.composeLeft(sqrt:/1) . (n)
n
```

Operator form:

```
>>> (squared:/1 @* sqrt:/1) . (23)
23
```

* * *

See also: @*, bindLeft, bindRight, composeRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Compose),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:.),
_Mathematica_
[1](https://mathworld.wolfram.com/Composition.html)
[2](https://reference.wolfram.com/language/ref/Composition.html)
