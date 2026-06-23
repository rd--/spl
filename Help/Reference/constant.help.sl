# constant

- _constant(x, n=1)_

Answer an _n_-ary `Block` that always answers the object _x_,
ignoring the _n_ argument values.
Implemented for _n=0,1,2_.

```
>>> let f:/1 = 42.constant;
>>> f(23)
42

>>> 1:4.collect(42.constant)
[42 42 42 42]

>>> 1:3.subsets(true.constant)
[; 1; 2; 1 2; 3; 1 3; 2 3; 1 2 3]
```

Construct a zero-argument block that answers a constant value,
ordinarily it is simpler to type the `Block` syntax directly:

```
>>> 42.constant(0) ! 4
[42 42 42 42]

>>> { 42 } ! 4
[42 42 42 42]
```

Construct a two-argument block that answers a constant value:

```
>>> 42.constant(2)
>>> .map([1 2 3 4], [5 6 7 8])
[42 42 42 42]

>>> *.map([1 2 3 4], [5 6 7 8])
[5 12 21 32]
```

* * *

See also: bindLeft, bindRight, memoize

Guides: Block Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Constant),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:const)

Unicode: U+2368 ⍨ APL Functional Symbol Tilde Diaeresis
