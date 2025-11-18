# intervalVariety

- _intervalVariety(aScale, anInteger)_

Answer the `size` of the `intervalClass` of the generic interval _anInteger_ of _aScale_.

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> 1:7.collect { :each |
>>> 	s.intervalVariety(each)
>>> }
[2 2 2 2 2 2 1]
```

* * *

See also: intervalClass, intervals, intervalsBy, isProper, isStrictlyProper, Scale

Guides: Scale Functions, Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_variety)
