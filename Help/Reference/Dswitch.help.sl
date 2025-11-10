# Dswitch

- _Dswitch(index, list)_

Demand rate generator for embedding different inputs

Demand rate generator for embedding different inputs.
Unlike Dswitch1, Dswitch embeds all items of an input demand Ugen first,
before looking up the next index.

- list: list of values or other ugens
- index: which of the inputs to return

```
let d = Dswitch(
	Dseq(2, [0 1 2 1 0]),
	[
		Dwhite(2, 3, 4),
		Dwhite(2, 0, 1),
		Dseq(2, [1 1 1 0])
	]
);
let trig = Impulse(4, 0);
2 # [
	SinOsc(
		Demand(trig, 0, d) * 300 + 400,
		0
	)
]
```

Compare with Dswitch1:

```
let d = Dswitch1(
	Dseq(2, [0 1 2 1 0]),
	[
		Dwhite(2, 3, 4),
		Dwhite(2, 0, 1),
		Dseq(2, [1 1 1 0])
	]
);
let trig = Impulse(4, 0);
2 # [
	SinOsc(
		Demand(trig, 0, d) * 300 + 400,
		0
	) * 0.1
]
```

* * *

See also: Demand, Dswitch1

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dswitch.html)

Categories: Ugen
