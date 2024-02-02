# TwIndex -- indexing

When triggered, answers a random index value based on array as a list of probabilities.
By default the list of probabilities should sum to 1.
When the normalize flag is set to 1, the values get normalized by the Ugen (less efficient).

_TwIndex(in, normalize=0, array)_

- input: the trigger.
- normalize: Controls whether to normalize the probability values.
- array: The list of probabilities.

Note: Normalize and array input values should be control rate only.

Assuming normalized values:

	let trig = Impulse(6, 0).kr;
	let index = TwIndex(trig, 0, [0.05, 0.45, 0.5]);
	SinOsc(Select(index, [333 444 555]), 0) * 0.1

Modulating probability values:

	let trig = Impulse(6, 0).kr;
	let w3 = SinOsc(1 / 5, 0).kr * 0.5 + 0.5;
	let index = TwIndex(
		trig,
		1,
		[0.05, 0.25, w3]
	);
	[
		SinOsc(Select(index, [333 444 555]), 0),
		SinOsc(w3.LinLin(0, 1, 444, 555), 0) / 3
	] * 0.1
