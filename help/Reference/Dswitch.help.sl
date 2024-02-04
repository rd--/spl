# Dswitch

Demand rate generator for embedding different inputs

Demand rate generator for embedding different inputs.
Unlike Dswitch1, Dswitch embeds all items of an input demand Ugen first,
before looking up the next index.

_Dswitch(index, list)_

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
SinOsc(
	Demand(trig, 0, d) * 300 + 400,
	0
) * 0.1 ! 2
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
SinOsc(
	Demand(trig, 0, d) * 300 + 400,
	0
) * 0.1 ! 2
```

* * *

See also: Demand, Dswitch1
