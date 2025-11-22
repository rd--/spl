# to

- _to(i, j)_

Construct a `Range` by counting from the start value _i_ up to the stop value _j_ by `one`.

```
>>> 1.to(5).asList
[1 2 3 4 5]

>>> to(6, 10).asList
[6 7 8 9 10]
```

If _j_ is less than _i_ the `Range` is empty:

```
>>> let r = 5.to(1);
>>> (r.isEmpty, r.size, r.asList)
(true, 0, [])

>>> 42.to(1).asList
[]
```

To write a descending `Range` see `Range Syntax`, `Range Literal Syntax`, `thenTo` or `toBy`:

```
>>> 7:3:-1.asList
[7 6 5 4 3]

>>> (7, 6 .. 3).asList
[7 6 5 4 3]

>>> 7.toBy(3, -1).asList
[7 6 5 4 3]

>>> 7.thenTo(6, 3).asList
[7 6 5 4 3]
```

Threads over lists:

```
>>> [0 2].to(4)
[0:4 2:4]

>>> 0.to([2 4])
[0:2 0:4]

>>> [0 2].to([3 5 7])
[0:3 2:5 0:7]
```

_Rationale_:
The behaviour when _j<i_ is inherited from Smalltalk,
and mirrors the behaviour at Haskell.
It allows writing _1.to(k)_ as a sequence of indices into collection of size _k_,
where _k_ may be zero.

* * *

See also: Range, thenTo, toBy, upOrDownTo

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:enumFromTo),
_Smalltalk_
5.6.2.37,
_SuperCollider_
[1](https://doc.sccode.org/Classes/Integer.html#-to)

Categories: Constructor, Range
