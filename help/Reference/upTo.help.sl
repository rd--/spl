# upTo

- _upTo(start, stop)_

Construct a Range by counting up from _start_ to _stop_ by one.
Unlike _to_ it is an error if stop is less than start.

```
>>> 1.upTo(5).asList
[1 2 3 4 5]

>>> { 5.upTo(1) }.ifError { true }
true
```

* * *

See also: downTo, Range, thenTo, to, toBy

Categories: Range
