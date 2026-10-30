# demand

- _demand(trig, reset=0, demandUgens)_

demand results from demand rate Ugens.

When there is a trigger at the _trig_ input, a value is demanded each Ugen in the list and output.
The unit generators in the list should be _demand_ rate.

When there is a trigger at the reset input, the demand rate Ugens in the list are reset.

- trig: read next value when triggered
- reset: resets the list of Ugens when triggered
- demandUgens: list of demand-rate Ugens to get values from. When the shortest stream ends, this Ugen will set the 'done' flag.

By design, a reset trigger only resets the demand ugens;
it does not reset the value at the output of demand.
demand continues to hold its value until the next value is demanded,
at which point its output value will be the first expected item in the list.
To jump to the start value upon receipt of a reset trigger,
one can add (+) the two triggers together:

One demand Ugen represents a single stream of values,
so that embedding the same Ugen twice calls this stream twice.

Mouse control of tone:

~~~spl syn=A
let trig = impulse(24, 0);
let seq = drand(2000, [
	dseq(1, [1 .. 5].mirror(1, 1)),
	drand(8, [4 .. 10])
]) * drand(2000, [1 1 1 2 2 2 4 4 8]);
let freq = demand(trig, 0, seq * 100);
let osc = sinOsc(freq + [0 0.7], 0);
osc.cube.cube.scaleNegative(
	mouseX(-1, 1, 0, 0.2)
) * 0.1
~~~

Randomly select among sequences:

~~~spl syn=B
let trig = impulse(8, 0);
let seq = drand(Infinity, [
	dseq(1, [4 0 0 1 2 1 0 1]),
	dseq(1, [4 0 2 0 1 0 1 1]),
	dseq(1, [4 0 0 2 0 0 1 1]),
	dseq(1, [4 0 1 2 0 1 2 0]),
	dseq(1, [4 1 1 1 2 2 3 3]),
	dseq(1, [4 1 0 1 0 1 0 1])
]);
let trigSeq = demand(
	trig,
	0,
	seq * 0.4
) * trig;
{
	lpf(pinkNoise(), 5000)
} ! 2 * decay(trigSeq, 0.5)
~~~

* * *

See also: duty, tDuty

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Demand.html)
