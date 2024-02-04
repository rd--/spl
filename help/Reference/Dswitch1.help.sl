# Dswitch1

Demand rate generator for switching between inputs.

_Dswitch1(index, list)_

- index: Which of the inputs to return.
- list: List of values or other UGens.

MouseX selects input:

```
let a = Dswitch1(
	MouseX(0, 4, 0, 0.2),
	[1, 3, MouseY(1, 15, 0, 0.2), 2, Dwhite(inf, 0, 3)]
);
let trig = Impulse(3, 0);
let freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

Inputs are of increasing number of steps:

```
let a = Dswitch1(
	MouseX(0, 4, 0, 0.2),
	0:4.collect { :i |
		Dseq(inf, [0 .. i * 3])
	}
);
let trig = Impulse(6, 0);
let freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Demand, Duty, TDuty, Dswitch
