# gen09

- _gen09(anInteger, aMatrix)_

Generate composite waveforms made up of weighted sums of simple sinusoids.
The specification of each contributing partial requires 3 fields:

- partial number, must be positive, but need not be a whole number
- amplitude of partial, negative values imply a 180 degree phase shift
- initial phase of partial, expressed in degrees

The answer is scaled to unity.

An approximation of square wave:

~~~
(2 ^ 10).gen09([1 3 0; 3 1 0; 9 0.33333 180]).plot
~~~

The same partials and amplitude as above, with phase shifts:

~~~
(2 ^ 10).gen09([1 3 180; 3 1 0; 9 0.33333 0]).plot
~~~

* * *

See also: addSine, gen10

References:
_Csound_
[1](https://www.csounds.com/manual/html/GEN09.html)
