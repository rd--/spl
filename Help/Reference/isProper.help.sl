# isProper

- _isProper(x)_

Answer `true` if _x_ is proper, else `false`.

A `Range` is proper if it is not empty,
and if the `stop` value is the `last` value:

```
>>> let r = 1:9;
>>> (r.isEmpty, r.stop, r.last, r.isProper)
(false, 9, 9, true)
```

A `Scale` is proper (Rothenberg 1977) if its `intervalClasses` are ascending,
allowing equal elements at adjacent steps.

A proper scale:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .isProper
true
```

An improper scale:

```
>>> Scale(1, [1 3 2 2 1 1], 'Enigmatic')
>>> .isProper
false
```

A strictly proper scale is also proper:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .isProper
true
```

* * *

See also: intervalClasses, isMomentOfSymmetry, isImproper, isNormal, isStrictlyProper, Range, scalaScaleArchive, Scale

Guides: Scale Functions

Further Reading: Rothenberg 1977
