# mixedRadixDecode

- _mixedRadixDecode(e, b)_

Given an mixed radix encoded integer _e_,
and a list of bases _b_,
answer the decoded integer.

Add different denominations of money:

```
>>> let b = [2 2.5 2];
>>> let e = [5 1 2 1.32];
>>> e.mixedRadixDecode(b)
60.32

>>> let u = [10 5 2 1];
>>> let c = [5 1 2 1.32];
>>> c.numberCompose(u)
60.32

>>> let u = [10 5 2 1];
>>> let c = [5 1 2 1.32];
>>> (u * c).sum
60.32
```

Add amounts of days, hours, minutes, and seconds to return seconds:

```
>>> let b = [24 60 60];
>>> let e = [1 3 46 40];
>>> e.mixedRadixDecode(b)
1E5

>>> let u = [86400 3600 60 1];
>>> let c = [1 3 46 40];
>>> c.numberCompose(u)
1E5
```

* * *

See also: mixedRadixEncode, numberCompose

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MixedRadix.html),
_W_
[1](https://en.wikipedia.org/wiki/Mixed_radix)
