# downTo

- _downTo(start, stop)_

Construct a Range by counting down from _start_ to _stop_ by one.
Unlike _to_ it is an error if stop is greater than start.

```
>>> 5.downTo(1).asList
[5 4 3 2 1]

>>> { 1.downTo(5) }.ifError { true }
true
```

* * *

See also: downTo, Range, thenTo, toBy, upOrDownTo, upTo

Categories: Range
