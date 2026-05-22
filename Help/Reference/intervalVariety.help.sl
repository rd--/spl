# intervalVariety

- _intervalVariety(s, n)_

Answer the `size` of the `intervalClass` of the generic interval _n_ of the scale _s_.

```
>>> let s = Scale([2 2 1 2 2 2 1], 'Maj.');
>>> 1:7.collect { :n |
>>> 	s.intervalVariety(n)
>>> }
[2 2 2 2 2 2 1]
```

Threads over lists:

```
>>> Scale[2 1 2 2 2 2 1]
>>> .intervalVariety(1:7)
[2 2 3 3 2 2 1]

>>> Scale[3 1 2 3 1 2 1]
>>> .intervalVariety(1:7)
[3 3 3 3 3 3 1]

>>> Scale[3 1 1 2 3 2 1]
>>> .intervalVariety(1:7)
[3 4 4 4 4 3 1]
```

* * *

See also: intervalClass, intervals, intervalsBy, isProper, isStrictlyProper, Scale

Guides: Scale Functions, Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_variety)
