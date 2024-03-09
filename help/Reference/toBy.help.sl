# toBy

- _toBy(start, stop, step)_

Construct a `Range` by counting up or down from _start_ to _stop_ by _step_.

```
>>> 1.toBy(9, 2).asList
[1 3 5 7 9]

>>> 9.toBy(1, -2).asList
[9 7 5 3 1]
```

It is an `error` if _step_ is zero:

```
>>> { 1.toBy(9, 0) }.ifError { true }
true
```

* * *

See also: Range, thenTo, to, upOrDownTo

References:
_Smalltalk_
5.6.2.38

Categories: Constructor, Range
