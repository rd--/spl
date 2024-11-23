# gen11

- _gen11(size, numberOfHarmonics, lowestHarmonic, multiplier)_

Generates an additive set of cosine partials,
in the manner of Csound generator _buzz_.
The answer is scaled to unity.

A cosine table:

~~~
(2 ^ 10).gen11(1, 1, 1).linePlot
~~~

An approximation of a sawtooth wave, fundamental and eight harmonics:

~~~
(2 ^ 10).gen11(10, 1, 0.7).linePlot
~~~

An approximation of a square wave, fundamental and eight harmonics, four zeroed:

~~~
(2 ^ 10).gen11(10, 5, 2).linePlot
~~~

* * *

See also: Csound Gen Routines, gen09, gen10, gen19

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN11.html)
