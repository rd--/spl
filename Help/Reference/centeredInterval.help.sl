# centeredInterval

- _centeredInterval(x, dx)_

Answer an `Interval` centered at _x_ and extending from _x-dx_ to _x+dx_.

```
>>> 60.centeredInterval(10)
Interval(50, 70)
```

Threads over lists:

```
>>> [50 60 70].centeredInterval([5 10 15])
[45 -- 55, 50 -- 70, 55 -- 85]
```

* * *

See also: Interval, --

Guides: Interval Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Interval.html)
[2](https://reference.wolfram.com/language/ref/Interval.html),
_W_
[1](https://en.wikipedia.org/wiki/Interval_(mathematics))

Categories: Collection, Number, Type
