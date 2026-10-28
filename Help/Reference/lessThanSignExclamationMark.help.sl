# <! (lessThanSignExclamationMark)

- _u <! v_

Evaluates to the unit generator _u_ after attaching another unit generator, _v_, to it.

Ensures _v_ is included in the graph of which _u_ is a part,
in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `localOut` &etc.

Stereo cross channel feedback modulation with mouse control:

~~~
let index = 5;
let fb = [10 5];
let pan = 0;
let amp = 0.1;
let freq = mouseY(20, 4000, 1, 0.2);
let mratio = mouseX(1 / 8, 8, 1, 0.2);
let in = localIn(2, [0 0]);
let mod = [
	sinOsc(freq * mratio, 0),
	freq,
	mratio,
	index
].product;
let car = sinOsc(
	[
		freq * mod * in.second,
		freq + mod + in.first
	],
	0
);
let out = pan2(leakDc(car.sum, 0.995), pan, amp);
out <! localOut(car * fb)
~~~

_Note_:
This uses `FirstArg` where _anotherunit generator_ has output ports,
else it uses `multipleRootGraph`.

The name of this operator is `lessThanSignExclamationMark`.

* * *

See also: FirstArg, multipleRootGraph

References:
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#%3C!)

Categories: Ugen
