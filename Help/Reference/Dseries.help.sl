# Dseries

- _Dseries(length=inf, start=1, step=1)_

Demand rate arithmetic series UGen.

- start: Start value
- step: Step value
- length: Number of values to create.

Finite ascending sequences:

```
let seq = Dseries(15, 0, [1, 2]);
let trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
let freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

Ascending sequences:

```
let seq = Dseries(inf, 0, [1, 3]);
let trig = Dust(MouseX(1, 40, 1, 0.2));
let freq = Demand(trig, 0, seq) % [15, 45] * 30 + 340;
SinOsc(freq.Lag(0.025), 0) * 0.1
```

Plotting:

~~~
Duty(
	0.004,
	0,
	Dseries(inf, 1, [1, 2])
).plot(0.1)
~~~

Note that a very similar,
but not identical,
signal can be generated using `PulseCount` and `Impulse` as:

~~~
(
	PulseCount(
		Impulse(1 / 0.004, 0),
		0
	) * [1, 2]
).plot(0.1)
~~~

* * *

See also: Demand, Dgeom, Duty, TDuty

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dseries.html)

Categories: Ugen
