# isImproper

- _isImproper(aScale)_

Answer `true` if _aScale_ is improper, else `false`.

An improper scale (Rothenberg 1977) is a scale that is not proper.

An improper five note scale:

```
>>> Scale(1, [2 1 4 1 4], 'Hirajōshi')
>>> .isImproper
true
```

An improper seven note scale:

```
>>> Scale(1, [1 3 2 2 1 1], 'Enigmatic')
>>> .isImproper
true
```

* * *

See also: isMomentOfSymmetry, isProper, isStrictlyProper, Scale

Guides: Scale Functions

Further Reading: Rothenberg 1977
