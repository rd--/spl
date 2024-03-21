# ratios

- _ratios(aSequence)_

Answer the successive ratios of elements in list.

Ratios of a `Range`:

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

`scanLeft` of `*` is a kind of inverse:

```
>>> [1/1 2/1 3/2 4/3 5/4].scanLeft(*)
[1 2 3 4 5]

>>> [1 2 2 2 2 2 2 2 2 2 2].scanLeft(*)
[1 2 4 8 16 32 64 128 256 512 1024]
```

* * *

See also: /, differences, geometricSeries, powerRange, scanLeft

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonRatio.html)
[2](https://reference.wolfram.com/language/ref/Ratios.html)

Categories: Math
