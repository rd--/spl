# constant

- _constant(anObject)_

Answer a unary Block that always answers _anObject_.

```
>>> 1:4.collect(42.constant)
[42 42 42 42]

>>> 1:3.subsets(true.constant)
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

* * *

See also: bindLeft, bindRight

References:
_Apl_
[1](https://aplwiki.com/wiki/Constant),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:const)
