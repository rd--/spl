# gen05

- _gen05(anInteger, aSequence)_

Constructs functions from segments of exponential curves.
The specification consists of alternating level and duration items.

Waveform that goes over 100 points from 1 to 0.0001, and stays there for 29 points:

~~~
129.gen05(
	[1 100 0.0001 29 0.0001]
).linePlot
~~~

![](sw/spl/Help/Image/gen05-A.svg)

Waveform that goes from 0.00001 to 1 in 87 points,
then from 1 to 0.5 in 22 points,
and then from 0.5 to 0.0001 in 20 points:

~~~
129.gen05(
	[0.00001 87 1 22 0.5 20 0.0001]
).linePlot
~~~

![](sw/spl/Help/Image/gen05-B.svg)

* * *

See also: gen07, gen16

Guides: Csound Gen Routines

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN05.html)
