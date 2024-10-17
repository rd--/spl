# Lag

- _Lag(in, lagTime=0.1)_

Exponential lag.
This is essentially the same as `OnePole` except that instead of supplying the coefficient directly, it is caculated from a 60 dB lag time.
This is the time required for the filter to converge to within 0.01% of a value.
This is useful for smoothing out control signals.

- in: input signal
- lagTime: 60 dB lag time in seconds.

As filter:

```
let x = LfPulse(300, 0, 0.5) * 0.1;
[x, Lag(x, 0.002)]
```

Used to lag pitch:

```
SinOsc( /* sine wave */
	Lag( /* lag the modulator */
		LfPulse(4, 0, 0.5) * 50 + 400, /* frequency modulator */
		Line(0, 1, 15) /* modulate lag time */
	),
0) /* phase */
* 0.3 /* sine amplitude */
```

* * *

See also: LagUd, OnePole

References:
_Csound_
[1](https://csound.com/docs/manual/lag.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Lag.html)

Categories: Ugen
