# isStrictlyProper

- _isStrictlyProper(aScale)_

Answer `true` if _aScale_ is strictly proper, else `false`.

A scale is strictly proper (Rothenberg 1977) if its `intervalClasses` are strictly ascending.

A strictly proper scale:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .isStrictlyProper
true
```

A scale that is proper, but not strictly proper:

```
>>> let s = Scale(1, [2 2 1 2 2 2 1], 'Maj.');
>>> (s.isStrictlyProper, s.isProper)
(false, true)
```

* * *

See also: intervalClasses, isMomentOfSymmetry, isImproper, isProper, Scale

Guides: Scale Functions

Further Reading: Rothenberg 1977
