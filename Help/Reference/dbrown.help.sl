# dbrown

- _dbrown(length, lo, hi, step)_

Noise generator.
demand rate brownian movement generator.

- length: number of values to create
- lo: minimum value
- hi: maximum value
- step: maximum step for each new value

_dbrown_ answers numbers in the continuous range between lo and hi.
The arguments can be a number or any other ugen.

```
let seq = dbrown(Infinity, 10, 15, 1);
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

* * *

See also: demand, dibrown, diwhite, dwhite

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dbrown.html)

Categories: Ugen, Noise
