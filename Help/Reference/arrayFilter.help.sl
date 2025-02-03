# arrayFilter

- _arrayFilter(aBlock:/1, aList, anInteger)_

Apply _aBlock_ to all _anInteger * 2 + 1_ sublists of _aList_.

```
>>> identity:/1.arrayFilter([1 .. 5], 1)
[1 1 2; 1 2 3; 2 3 4; 3 4 5; 4 5 5]
```

* * *

See also: blockMap, convolve, movingMap, parition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayFilter.html)
