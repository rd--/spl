# gen11

- _gen11(size, numberOfHarmonics, lowestHarmonic, multiplier)_

Generates an additive set of cosine partials,
in the manner of Csound generator _buzz_.
The answer is scaled to unity.

A cosine table:

~~~spl svg=A
(2 ^ 10).gen11(1, 1, 1).linePlot
~~~

![](sw/spl/Help/Image/gen11-A.svg)

An approximation of an impulse wave, fundamental and ten harmonics:

~~~spl svg=B
(2 ^ 10).gen11(10, 1, 0.7).linePlot
~~~

![](sw/spl/Help/Image/gen11-B.svg)

Ten harmonics starting at the fifth harmonic:

~~~spl svg=C
(2 ^ 10).gen11(10, 5, 2).linePlot
~~~

![](sw/spl/Help/Image/gen11-C.svg)

* * *

See also: gen09, gen10, gen19

Guides: Csound Gen Routines

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN11.html)
