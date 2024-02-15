# ratios

_ratios(aSequence)_

Answer the successive ratios of elements in list.

Ratios of a Range:

```
>>> 1:5.ratios
[2/1 3/2 4/3 5/4]
```

Ratios are constant for a geometric sequence:

```
>>> let l = 0:10.collect { :each | 2 ^ each };
>>> let r = l.ratios;
>>> (l, r)
([1 2 4 8 16 32 64 128 256 512 1024], [2 2 2 2 2 2 2 2 2 2])
```

* * *

See also: /, differences, powerRange

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Ratios.html)
