# upOrDownTo

- _upOrDownTo(start, stop)_

Construct a `Range` by counting up or down from _start_ to _stop_ by one.

Count up:

```
>>> 1.upOrDownTo(5).asList
[1 2 3 4 5]
```

Count down:

```
>>> 5.upOrDownTo(1).asList
[5 4 3 2 1]
```

The range cannot be empty, only singular:

```
>>> 1.upOrDownTo(1).asList
[1]
```

Threads over lists:

```
>>> [1 3 5].upOrDownTo([5 6 7 8])
[1:5, 3:6, 5:7, 1:8]
```

* * *

See also: Range, thenTo, to, toBy

Categories: Constructor, Range
