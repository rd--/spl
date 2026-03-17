# asRandomTable

- _asRandomTable([x₁ x₂ …], n)_

Given the sequence _x_ holding a discrete probability density function,
answer a sequence of _n_ places holding the associated cumulative distribution function.

Draw the discrete probability density function _1,1,0,1,1_:

~~~spl svg=A
[1 1 0 1 1].linePlot
~~~

![](Help/Image/asRandomTable-A.svg)

Draw the cumulative distribution function associated with the discrete probability density function _1,1,0,1,1_:

~~~spl svg=B
[1 1 0 1 1].asRandomTable(128).linePlot
~~~

![](Help/Image/asRandomTable-B.svg)

Draw the discrete probability density function _1,0,0,0,1,0,0,0,1_:

~~~spl svg=C
[1 0 0 0 1 0 0 0 1].linePlot
~~~

![](Help/Image/asRandomTable-C.svg)

Draw the cumulative distribution function associated with the discrete probability density function _1,0,0,0,1,0,0,0,1_:

~~~spl svg=D
[1 0 0 0 1 0 0 0 1]
.asRandomTable(128)
.linePlot
~~~

![](Help/Image/asRandomTable-D.svg)

* * *

See also: indexOfInBetween, normalizeRange, resample, tableRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ArrayedCollection.html#-asRandomTable)

Categories: Random
