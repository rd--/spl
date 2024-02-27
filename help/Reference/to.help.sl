# to

- _to(start, stop)_

Construct a `Range` by counting up from _start_ up to _stop_ by `one`.

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

See also: downTo, Range, thenTo, toBy, upTo, upOrDownTo

Categories: Constructor, Range
