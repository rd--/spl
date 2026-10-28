# twIndex

- _twIndex(in, normalize=0, array)_

Indexing.
When triggered, answers a random index value based on array as a list of probabilities.
By default the list of probabilities should sum to 1.
When the normalize flag is set to 1, the values get normalized by the Ugen (less efficient).

- input: the trigger
- normalize: Controls whether to normalize the probability values
- array: The list of probabilities

Note: Normalize and array input values should be control rate only.

Assuming normalized values:

```
let trig = impulse(6, 0).kr;
let index = twIndex(trig, 0, [0.05, 0.45, 0.5]);
sinOsc(selectT(index, [333 444 555]), 0) * 0.1
```

Modulating probability values:

```
let trig = impulse(6, 0).kr;
let w3 = sinOsc(1 / 5, 0).kr * 0.5 + 0.5;
let index = twIndex(
	trig,
	1,
	[0.05, 0.25, w3]
);
[
	sinOsc(selectT(index, [333 444 555]), 0),
	sinOsc(w3.linLin(0, 1, 444, 555), 0) / 3
] * 0.1
```

* * *

See also: selectT, twChoose

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/TWindex.html)

Categories: Ugen
