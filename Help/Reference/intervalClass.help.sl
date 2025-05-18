# intervalClass

- _intervalClass(aScale, anInteger)_

Answer the interval class for the generic interval _anInteger_ of _aScale_.

The interval class is the set of intervals in the answer of `intervalsBy`,
that is,
a set of specific intervals at a given generic interval:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (1 .. 7).collect { :each |
>>> 	s.intervalClass(each)
>>> }
[1 2; 3 4; 5 6; 6 7; 8 9; 10 11; 12]
```

* * *

See also: intervalClasses, intervals, intervalsBy, isProper, isStrictlyProper, Scale

Guides: Scale Functions, Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
