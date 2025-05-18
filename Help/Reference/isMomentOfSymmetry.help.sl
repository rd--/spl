# isMomentOfSymmetry

- _isMomentOfSymmetry(s)_

Answer `true` if the `Scale` _s_ is a moment of symmetry scale, else `false`.

Tells if each `intervalClass`,
with the exception of the _period_,
contains two intervals.

A moment of symmetry scale:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isMomentOfSymmetry
true
```

A not moment of symmetry scale:

```
>>> Scale(1, [2 1 2 2 2 2 1], 'Mel. Min.')
>>> .isMomentOfSymmetry
false
```

* * *

See also: intervalClass, intervalClasses, isBinary, isProper, isStrictlyProper, momentOfSymmetry, Scale

Guides: Xenharmonic Functions

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/MOS_scale)
