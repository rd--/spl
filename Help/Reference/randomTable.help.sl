# randomTable

- _randomTable([x₁ x₂ …], n)_

Given the sequence _x_ holding a discrete probability density function,
answer a sequence of _n_ places holding the associated cumulative distribution function.

Draw the discrete probability density function _1,1,0,1,1_:

~~~spl svg=A
[1 1 0 1 1].linePlot
~~~

![](Help/Image/randomTable-A.svg)

Draw the cumulative distribution function associated with the discrete probability density function _1,1,0,1,1_:

~~~spl svg=B
[1 1 0 1 1].randomTable(128).linePlot
~~~

![](Help/Image/randomTable-B.svg)

Draw the discrete probability density function _1,0,0,0,1,0,0,0,1_:

~~~spl svg=C
[1 0 0 0 1 0 0 0 1].linePlot
~~~

![](Help/Image/randomTable-C.svg)

Draw the cumulative distribution function associated with the discrete probability density function _1,0,0,0,1,0,0,0,1_:

~~~spl svg=D
[1 0 0 0 1 0 0 0 1]
.randomTable(128)
.linePlot
~~~

![](Help/Image/randomTable-D.svg)

Generate a random variate using `tableRand`:

~~~spl svg=E
let pdf = [1 0 0 0 1 0 0 0 1];
let cdf = pdf.randomTable(128);
let r = Sfc32(361824);
let v = { cdf.tableRand(r) } ! 10_000;
v.histogramPlot
~~~

![](Help/Image/randomTable-E.svg)

* * *

See also: indexOfInBetween, normalizeRange, resample, tableRand

Guides: Random Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/ArrayedCollection.html#-asRandomTable)

Categories: Random
