# asRandomTable

- _asRandomTable(aSequence, anInteger)_

Given _aSequence_ holding a discrete probability density function,
answer a sequence of _anInteger_ places holding the associated cumulative distribution function.

~~~
[1 1 0 1 1].linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-A.svg)

~~~
[1 1 0 1 1].asRandomTable(128).linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-B.svg)

~~~
[1 0 0 0 1 0 0 0 1].linePlot
~~~

![](sw/spl/Help/Image/asRandomTable-C.svg)

~~~
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
