# to

- _to(start, stop)_

Construct a `Range` by counting from _start_ up to _stop_ by `one`.

```
>>> 1.to(5).asList
[1 2 3 4 5]
```

If _stop_ is less than _start_ the `Range` is empty:

```
>>> let r = 5.to(1);
>>> (r.isEmpty, r.size, r.asList)
(true, 0, [])
```

_Rationale_:
The behaviour when _stop < start_ is inherited from Smalltalk.
It allows writing, for instance, _1.to(k)_ where _k_ may be zero.

* * *

See also: Range, thenTo, toBy, upOrDownTo

References:
_Smalltalk_
5.6.2.37

Categories: Constructor, Range
