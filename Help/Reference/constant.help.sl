# constant

- _constant(x)_

Answer a unary `Block` that always answers the object _x_,
ignoring the argument value.

```
>>> let f:/1 = 42.constant;
>>> f(23)
42

>>> 1:4.collect(42.constant)
[42 42 42 42]

>>> 1:3.subsets(true.constant)
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

* * *

See also: bindLeft, bindRight

Guides: Block Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Constant),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:const)

Unicode: U+2368 ⍨ APL Functional Symbol Tilde Diaeresis
