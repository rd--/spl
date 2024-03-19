# to

- _to(start, stop)_

Construct a `Range` by counting from _start_ up to _stop_ by `one`.

```
>>> 1.to(5).asList
[1 2 3 4 5]

>>> (6 to: 10).asList
[6 7 8 9 10]
```

If _stop_ is less than _start_ the `Range` is empty:

```
>>> let r = 5.to(1);
>>> (r.isEmpty, r.size, r.asList)
(true, 0, [])

>>> (42 to: 1).asList
[]
```

To write a descending `Range` see `Range Syntax` or `thenTo` or `toBy`:

```
>>> 7:5.asList
[7 6 5]

>>> (7 .. 5).asList
[7 6 5]

>>> 7.toBy(5, -1).asList
[7 6 5]

>>> 7.thenTo(6, 5).asList
[7 6 5]
```

_Rationale_:
The behaviour when _stop < start_ is inherited from Smalltalk,
and mirrors the behaviour at Haskell.
It allows writing _1.to(k)_ as a seqeuence of indices into collection of size _k_,
where _k_ may be zero.

* * *

See also: Range, thenTo, toBy, upOrDownTo

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:enumFromTo),
_Smalltalk_
5.6.2.37

Categories: Constructor, Range
