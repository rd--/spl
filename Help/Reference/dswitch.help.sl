# dswitch

- _dswitch(index, list)_

demand rate generator for embedding different inputs

demand rate generator for embedding different inputs.
Unlike dswitch1, dswitch embeds all items of an input demand Ugen first,
before looking up the next index.

- list: list of values or other ugens
- index: which of the inputs to return

```
let d = dswitch(
	dseq(2, [0 1 2 1 0]),
	[
		dwhite(2, 3, 4),
		dwhite(2, 0, 1),
		dseq(2, [1 1 1 0])
	]
);
let trig = impulse(4, 0);
[
	sinOsc(
		demand(trig, 0, d) * 300 + 400,
		0
	)
] # 2
```

Compare with dswitch1:

```
let d = dswitch1(
	dseq(2, [0 1 2 1 0]),
	[
		dwhite(2, 3, 4),
		dwhite(2, 0, 1),
		dseq(2, [1 1 1 0])
	]
);
let trig = impulse(4, 0);
[
	sinOsc(
		demand(trig, 0, d) * 300 + 400,
		0
	) * 0.1
] # 2
```

* * *

See also: demand, dswitch1

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dswitch.html)

Categories: Ugen
