# PulseDivider

- _PulseDivider(trig=0, div=2, startCount=0)_

Pulse divider.
Outputs one impulse each time it receives a certain number of triggers at its input.

- trig: trigger
- div: number of pulses to divide by.
- startCount: starting value for the trigger count.

The _startCount_ lets one start somewhere in the middle of a count,
or if startCount is negative it adds that many counts to the first time the output is triggers.

Lower tone at quarter the clock rate:

```
let p = Impulse(8, 0);
let p4 = PulseDivider(p, 4, 0);
[
	SinOsc(1200, 0) * Decay2(p, 0.005, 0.1),
	SinOsc(600, 0) * Decay2(p4, 0.005, 0.5)
] * 0.4
```

Four divisions:

```
let p = Impulse(8, 0);
let p2 = PulseDivider(p, 2, 1);
let p4 = PulseDivider(p, 4, 0);
let p16 = PulseDivider(p, 16, 0);
[
	SinOsc(1200, 0) * Decay2(p, 0.005, 0.1),
	SinOsc(800, 0) * Decay2(p2, 0.005, 0.5),
	SinOsc(600, 0) * Decay2(p4, 0.005, 0.5),
	SinOsc(200, 0) * Decay2(p16, 0.005, 1.0)
].Splay * 0.3
```

Array expansion:

```
let e = Impulse(8, 0).PulseDivider([3 5], 0).Perc(0.1, 0.1, -4);
e * SinOsc([333, 555], 0) * 0.1
```

* * *

See also: Impulse

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/PulseDivider.html)

Categories: Ugen
