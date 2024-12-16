# intervalClasses

- _intervalClasses(aScale)_

Answer the `intervalClass` for each possible generic interval of _aScale_ in sequence.

A strictly proper scale:

```
>>> Scale(1, [2 2 3 2 3], 'Maj. Pentatonic')
>>> .intervalClasses
[2 3; 4 5; 7 8; 9 10; 12]
```

A proper, but not strictly proper, scale:

```
>>> Scale(1, [2 2 1 2 2 2 1], 'Maj.')
>>> .intervalClasses
[1 2; 3 4; 5 6; 6 7; 8 9; 10 11; 12]
```

Of a ternary scale:

```
>>> Scale(7, [3, 1, 1, 2], 'Slendro Alit')
>>> .intervalClasses
[1 2 3; 2 3 4 5; 4 5 6; 7]
```

* * *

See also: intervalClass, isProper, isStrictlyProper, Scale

References:
_Xenharmonic_
[1](https://en.xen.wiki/w/Interval_class)
