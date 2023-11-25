# TwIndex -- indexing

When triggered, returns a random index value based on array as a list of probabilities.
By default the list of probabilities should sum to 1.
When the normalize flag is set to 1, the values get normalized by the Ugen (less efficient).

_TwIndex(in, normalize=0, array)_

- input: The trigger. Trigger can be any signal. A trigger happens when the signal changes from non-positive to positive.
- normalize: Controls whether to normalize the probability values.
- array: The list of probabilities.

Note: Normalize and array input values should be control rate only.

Assuming normalized values:

```
var trig = Impulse(6, 0).kr;
var index = TwIndex(trig, 0, [0.05, 0.45, 0.5]);
SinOsc(Select(index, [333 444 555]), 0) * 0.1
```

Modulating probability values:

```
var trig = Impulse(6, 0).kr;
var w3 = SinOsc(1 / 5, 0).kr * 0.5 + 0.5;
var index = TwIndex(
        trig,
	1,
        [0.05, 0.25, w3]
);
[
	SinOsc(Select(index, [333 444 555]), 0),
	SinOsc(w3.LinLin(0, 1, 444, 555), 0) / 3
] * 0.1
```
