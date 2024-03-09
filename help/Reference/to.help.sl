# to

- _to(start, stop)_

Construct a `Range` by counting from _start_ up to _stop_ by `one`.

```
>>> 1.to(5).asList
[1 2 3 4 5]
```

If _stop_ is less than _start_ the `Range` is empty:

```
>>> 5.to(1).asList
[]
```

* * *

See also: Range, thenTo, toBy, upOrDownTo

References:
_Smalltalk_
5.6.2.37

Categories: Constructor, Range
