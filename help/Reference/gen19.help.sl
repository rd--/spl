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

~~~
(2 ^ 10).gen19([[0.5 0.5 270 0.5]]).plot
~~~

* * *

See also: Csound Gen Routines, gen09, gen10, gen11

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN19.html)
