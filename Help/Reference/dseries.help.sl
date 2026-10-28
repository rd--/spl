# dseries

- _dseries(length=Infinity, start=1, step=1)_

demand rate arithmetic series UGen.

- start: Start value
- step: Step value
- length: Number of values to create.

Finite ascending sequences:

```
let seq = dseries(
	15,
	0,
	[1, 2]
);
let trig = impulse(
	mouseX(1, 40, 1, 0.2),
	0
);
let freq = demand(
	trig,
	0,
	seq
) * 30 + 340;
sinOsc(freq, 0) * 0.1
```

Ascending sequences:

```
let seq = dseries(
	Infinity,
	0,
	[1, 3]
);
let trig = dust(
	mouseX(1, 40, 1, 0.2)
);
let freq = demand(
	trig,
	0,
	seq
) % [15, 45] * 30 + 340;
sinOsc(freq.lag(0.025), 0) * 0.1
```

Plotting:

~~~spl ui
duty(
	0.004,
	0,
	dseries(Infinity, 1, [1, 2])
).soundPlot(0.1)
~~~

Note that a very similar,
but not identical,
signal can be generated using `pulseCount` and `impulse` as:

~~~spl ui
(
	pulseCount(
		impulse(1 / 0.004, 0),
		0
	) * [1, 2]
).soundPlot(0.1)
~~~

* * *

See also: demand, dgeom, duty, tDuty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dseries.html)

Categories: Ugen
