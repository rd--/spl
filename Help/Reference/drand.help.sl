# drand

- _drand(repeats, list)_

demand rate random sequence generator.

- repeats: number of values to return
- list: a list of values or other Ugens

```
{
	let seq = drand(Infinity, [1, 2, 3, 7, 8]);
	let trig = impulse(mouseX(1, 60, 1, 0.2), 0);
	let freq = demand(trig, 0, seq) * 30 + 340;
	sinOsc(freq, 0) * 0.1
} ! 2
```

* * *

See also: demand, tChoose

Guides: Unit Generators

Categories: Ugen
