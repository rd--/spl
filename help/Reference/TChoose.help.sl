# TChoose

Randomly select one of several inputs.

_TChoose(trig, list)_

An output is selected randomly on receiving a trigger from a list of inputs.

TChoose is defined in terms of Select and TiRand.

- trig: select new input
- list: list of inputs

Cycle though oscillator types, mouse control of trigger density:

```
let a = [
	SinOsc(440, 0),
	Saw(440),
	Pulse(440, 0.5)
];
TChoose(Dust(MouseX(1, 1000, 1, 0.2)), a) * 0.2
```

Note:
All ugens are continuously running.
This may not be the most efficient way if each input is cpu-expensive.

* * *

See also: Select
