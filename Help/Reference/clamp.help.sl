# clamp

- _clamp(x, ⌊, ⌈)_

Clamps _x to the inclusive range _(⌊,⌈)_.

```
>>> 15.clamp(0, 10)
10

>>> max(0, min(15, 10))
10

>>> -5.clamp(0, 10)
0

>>> 5.clamp(0, 10)
5
```

* * *

See also: clip, wrap

References:
_W_
[1](https://en.wikipedia.org/wiki/Clamp_(function))
