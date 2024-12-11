# asRandomTable

- _asRandomTable(aSequence, anInteger)_

Given _aSequence_ holding a discrete probability density function,
answer a sequence of _anInteger_ places holding the associated cumulative distribution function.

~~~spl svg=A
[1 1 0 1 1].linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-A.svg)

~~~spl svg=B
[1 1 0 1 1].asRandomTable(128).linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-B.svg)

~~~spl svg=C
[1 0 0 0 1 0 0 0 1].linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-C.svg)

~~~spl svg=D
[1 0 0 0 1 0 0 0 1]
.asRandomTable(128)
.linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-D.svg)

* * *

See also: indexOfInBetween, normalizeRange, resample, tableRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ArrayedCollection.html#-asRandomTable)

Categories: Random
