# identity

- _identity(anObject)_

Answer _anObject_.

```
>>> 1.identity
1
```

As argument block:

```
>>> [1 2 3 4 3 2 1].detectMax(identity:/1)
4

>>> [1 3 5 3 5 5].histogramOf(identity:/1).sortedCounts
[3 -> 5, 2 -> 3, 1 -> 1]
```

* * *

See also: leftIdentity, rightIdentity

References:
_Apl_
[1](https://aplwiki.com/wiki/Identity)
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:id),
_Mathematica_
[1](https://mathworld.wolfram.com/Identity.html)
[2](https://reference.wolfram.com/language/ref/Identity.html),
_Smalltalk_
5.3.1.20
