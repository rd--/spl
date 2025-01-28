# Drand

- _Drand(repeats, list)_

Demand rate random sequence generator.

- repeats: number of values to return
- list: a list of values or other Ugens

```
{
	let seq = Drand(Infinity, [1, 2, 3, 7, 8]);
	let trig = Impulse(MouseX(1, 60, 1, 0.2), 0);
	let freq = Demand(trig, 0, seq) * 30 + 340;
	SinOsc(freq, 0) * 0.1
} ! 2
```

* * *

See also: Demand, TChoose

Categories: Ugen
