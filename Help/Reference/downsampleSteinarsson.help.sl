# downsampleSteinarsson

- _downsampleSteinarsson(aVector | aMatrix, anInteger)_

Downsample time series data at the two column _aMatrix_ to have _anInteger_ places.
In the vector case provide indices as time series column.

At `List`:

```
>>> [2 2 3 3 6 3 3 5 4 4 1 2]
>>> .downsampleSteinarsson(3)
[1 2; 5 6; 12 2]
```

At two-column matrix:

```
>>> let ts = [
>>> 	1 2;
>>> 	2 2;
>>> 	3 3;
>>> 	4 3;
>>> 	5 6;
>>> 	6 3;
>>> 	7 3;
>>> 	8 5;
>>> 	9 4;
>>> 	10 4;
>>> 	11 1;
>>> 	12 2
>>> ];
>>> ts.downsampleSteinarsson(3)
[
	1 2;
	5 6;
	12 2
]
```

A random walk of three-hundred places:

~~~spl svg=A
Sfc32(378916)
.randomReal([-1 1], 300)
.accumulate
.linePlot
~~~

![](sw/spl/Help/Image/downsampleSteinarsson-A.svg)

Downsample to one-hundred places:

~~~spl svg=B
Sfc32(378916)
.randomReal([-1 1], [300])
.accumulate
.downsampleSteinarsson(100)
.linePlot
~~~

![](sw/spl/Help/Image/downsampleSteinarsson-B.svg)

Downsample to thirty places:

~~~spl svg=C
Sfc32(378916)
.randomReal([-1 1], [300])
.accumulate
.downsampleSteinarsson(30)
.linePlot
~~~

![](sw/spl/Help/Image/downsampleSteinarsson-C.svg)

* * *

See also: downsample, resample, upsample

Further Reading: Steinarsson 2013

Categories: Rearranging
