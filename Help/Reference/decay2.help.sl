# decay2

- _decay2(in, attackTime=0.01, decayTime=1)_

Exponential decay.
`decay` has a very sharp attack and can produce clicks.
`decay2` rounds off the attack by subtracting one `decay` from another.
_decay2(in, attackTime, decayTime)_ is equivalent to _decay(in, decayTime) - decay(in, attackTime)_.

- in: input signal
- attackTime: 60 dB attack time in seconds.
- decayTime: 60 dB decay time in seconds.

One millisecond attack, one centisecond decay:

```
decay2(impulse(1, 0), 0.001, 0.01)
```

Since attack and decay are a difference of two Decays, if you swap the values, then the envelope turns upside down:

```
decay2(impulse(1, 0), 0.01, 0.001)
```

Used as an envelope:

```
decay2(
	impulse(xLine(1, 50, 20), 0) * 0.25,
	0.01,
	0.2
) * fSinOsc(600, 0)
```

Compare the above with decay used as the envelope:

```
decay(
	impulse(xLine(1, 50, 20), 0) * 0.25,
	0.2
) * fSinOsc(600, 0)
```

Plot excitation function:

~~~spl ui
let strike = impulse(1, 0);
let env = decay2(strike, 0.01, 0.06) * 0.4;
let noise = lfNoise2(3000) * env;
[env, noise].soundPlot(0.1)
~~~

* * *

See also: decay

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Decay2.html)

Categories: Ugen, Envelope
