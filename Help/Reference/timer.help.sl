# timer

- _timer(trig)_

Returns time since last triggered.

Using timer to modulate sine frequency, the slower the trigger is the higher the frequency:

```
let x = mouseX(0.5, 20, 1, 0.2);
let trig = impulse(x, 0);
sinOsc(
	[
		x * 20 + 100,
		timer(trig) * 500 + 500
	],
	0
) * 0.1
```

* * *

See also: changed, gate, lastValue, latch

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Timer.html)

Categories: Ugen
