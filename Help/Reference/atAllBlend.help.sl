# atAllBlend

- _atAllBlend(aSequence, indices)_

Answer the elements of _aSeqence_ at each index in _indices_ using `atBlend`.

```
>>> [1 3 5 7 9].atAllBlend([1, 1.5 .. 5])
[1 2 3 4 5 6 7 8 9]

>>> [1 3 9].atAllBlend([1, 1.25 .. 3])
[1 1.5 2 2.5 3 4.5 6 7.5 9]
```

Plot:

~~~spl svg=A
[1 3 9 7 1]
.atAllBlend([1, 1.1 .. 5])
.discretePlot
~~~

![](sw/spl/Help/Image/atAllBlend-A.svg)

* * *

See also: at, atAll, atBlend, blend
