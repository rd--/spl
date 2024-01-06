# Demand -- demand results from demand rate ugens

_Demand(trig, reset=0, demandUgens)_

When there is a trigger at the _trig_ input, a value is demanded each Ugen in the list and output.
The unit generators in the list should be _demand_ rate.

When there is a trigger at the reset input, the demand rate Ugens in the list are reset.

- trig: read next value when triggered
- reset: resets the list of Ugens when triggered
- demandUgens: list of demand-rate Ugens to get values from. When the shortest stream ends, this Ugen will set the 'done' flag.

By design, a reset trigger only resets the demand ugens;
it does not reset the value at the output of Demand.
Demand continues to hold its value until the next value is demanded,
at which point its output value will be the first expected item in the list.
To jump to the start value upon receipt of a reset trigger,
one can add (+) the two triggers together:

One demand Ugen represents a single stream of values,
so that embedding the same Ugen twice calls this stream twice.

Mouse control of tone:

	let trig = Impulse(24, 0);
	let seq = Drand(2000, [
		Dseq(1, [1 .. 5].mirror1),
		Drand(8, [4 .. 10])
	]) * Drand(2000, [1 1 1 2 2 2 4 4 8]);
	let freq = Demand(trig, 0, seq * 100);
	let osc = SinOsc(freq + [0 0.7], 0);
	osc.Cubed.Cubed.ScaleNeg(MouseX(-1, 1, 0, 0.2)) * 0.1

Randomly select among sequences:

	let trig = Impulse(8, 0);
	let seq = Drand(inf, [
		Dseq(1, [4 0 0 1 2 1 0 1]),
		Dseq(1, [4 0 2 0 1 0 1 1]),
		Dseq(1, [4 0 0 2 0 0 1 1]),
		Dseq(1, [4 0 1 2 0 1 2 0]),
		Dseq(1, [4 1 1 1 2 2 3 3]),
		Dseq(1, [4 1 0 1 0 1 0 1])
	]);
	let trigSeq = Demand(trig, 0, seq * 0.4) * trig;
	{ Lpf(PinkNoise(), 5000) } ! 2 * Decay(trigSeq, 0.5)

* * *

See also: Duty, TDuty
