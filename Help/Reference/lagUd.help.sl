# lagUd

- _lagUd(in, lagTimeU=0.1, lagTimeD=0.1)_

This is essentially the same as `lag` except that you can supply a different 60 dB time for when the signal goes up, from when the signal goes down.
This is useful for smoothing out control signals, where _fade in_ should be different from _fade out_.

- in: input signal
- lagTimeU: 60dB lag time in seconds for the upgoing signal
- lagTimeD: 60dB lag time in seconds for the downgoing signal

* * *

See also: lag, lag2, Lag2Ud, lag3, lag3Ud

Guides: Unit Generators

References:
_Csound_
[1](https://csound.com/docs/manual/lagud.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/LagUD.html)

Categories: Ugen
