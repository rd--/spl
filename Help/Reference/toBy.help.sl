# toBy

- _toBy(start, stop, step)_

Construct a `Range` by counting up or down from _start_ to _stop_ by _step_.

```
>>> 1.toBy(9, 2).asList
[1 3 5 7 9]

>>> Range(1, 9, 2).asList
[1 3 5 7 9]

>>> 9.toBy(1, -2).asList
[9 7 5 3 1]
```

It is an `error` if _step_ is zero:

```
>>> { 1.toBy(9, 0) }.ifError { true }
true
```

If _step_ does not lead towards _stop_, the `Range` is empty:

```
>>> 1.toBy(9, -1).size
0

>>> 2.toBy(1, 1).size
0
```

_Rationale_:
The behaviour when _step_ does not lead towards _stop_ is inherited from Smalltalk.
It allows writing, for instance, _1.toBy(k, 1)_ where _k_ may be zero.

* * *

See also: Range, thenTo, to, upOrDownTo

References:
_Smalltalk_
5.6.2.38

Categories: Constructor, Range
