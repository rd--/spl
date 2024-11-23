# gen10

- _gen10(anInteger, amplitudes)_

Generate composite waveforms made up of weighted sums of simple sinusoids.
The specification of each contributing partial requires one field:

- amplitude of partial, negative values imply a 180 degree phase shift

The answer is scaled to unity.

A sine table:

~~~
(2 ^ 10).gen10([1]).linePlot
~~~

An approximation of a sawtooth wave, fundamental and eight harmonics:

~~~
(2 ^ 10).gen10([1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 0.111]).linePlot
~~~

An approximation of a square wave, fundamental and eight harmonics, four zeroed:

~~~
(2 ^ 10).gen10([1 0 0.3 0 0.2 0 0.14 0 0.111]).linePlot
~~~

An approximation of a pulse wave, fundamental and eight harmonics:

~~~
(2 ^ 10).gen10([1 1 1 1 0.7 0.5 0.3 0.1]).linePlot
~~~

* * *

See also: Csound Gen Routines, gen09, gen11, gen19

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN10.html)
