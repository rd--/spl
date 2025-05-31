# gen19

- _gen19(anInteger, aMatrix)_

Generate composite waveforms made up of weighted sums of simple sinusoids.
The specification of each contributing partial requires four fields:

- partial number, must be positive, but need not be a whole number
- amplitude of partial, negative values imply a 180 degree phase shift
- initial phase of partial, expressed in degrees
- offset, applied after amplitude scaling

The answer is scaled to unity.

A rising sigmoid:

~~~spl svg=A
(2 ^ 10).gen19([[0.5 0.5 270 0.5]]).linePlot
~~~

![](sw/spl/Help/Image/gen19-A.svg)

* * *

See also: gen09, gen10, gen11

Guides: Csound Gen Routines

References:
_Csound_
[1](https://csound.com/docs/manual/GEN19.html)
