# isProper

- _isProper(aScale)_

Answer `true` if _aScale_ is proper, else `false`.

A scale is proper (Rothenberg 1977) if its `intervalClasses` are ascending,
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

See also: intervalClasses, isMomentOfSymmetry, isImproper, isStrictlyProper, scalaScaleArchive, Scale

Further Reading: Rothenberg 1977
