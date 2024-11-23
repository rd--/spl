# TwChoose

- _TwChoose(trig, list, weights, normalize=0)_

Indexing.
Randomly select one of several inputs

An output is selected randomly on receiving a trigger from a list of inputs.

The weights of this choice are determined from the weights list.

If normalize is set to 1 the weights are continuously normalized (this is an extra overhead) when using fixed values the normalizeSum method can be used to normalize the values.

TwChoose is a composite of `TwIndex` and `Select`.

```
let list = [
	SinOsc(111, 0),
	Saw(333),
	Pulse(555, 0.5)
] / [9 17 23];
let weights = [0.7 0.2 0.1];
TwChoose(
	Dust(MouseX(1, 1000, 1, 0.2)),
	list,
	weights,
	0
)
```

Note: All Ugens are continuously running.
This may not be the most efficient way if each input is Cpu-expensive.

* * *

See also: Multiplexer, Select, TChoose, TwIndex

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TWChoose.html)

Categories: Ugen
