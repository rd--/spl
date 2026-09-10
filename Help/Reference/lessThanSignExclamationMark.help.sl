# <! (lessThanSignExclamationMark)

- _u <! v_

Evaluates to the unit generator _u_ after attaching another unit generator, _v_, to it.

Ensures _v_ is included in the graph of which _u_ is a part,
in cases where it would otherwise not be discovered by traversing the completed graph.

Required where graphs have multiple end points, such as graphs using `LocalOut` &etc.

Stereo cross channel feedback modulation with mouse control:

~~~
let index = 5;
let fb = [10 5];
let pan = 0;
let amp = 0.1;
let freq = MouseY(20, 4000, 1, 0.2);
let mratio = MouseX(1 / 8, 8, 1, 0.2);
let in = LocalIn(2, [0 0]);
let mod = [
	SinOsc(freq * mratio, 0),
	freq,
	mratio,
	index
].product;
let car = SinOsc(
	[
		freq * mod * in.second,
		freq + mod + in.first
	],
	0
);
let out = Pan2(LeakDc(car.Sum, 0.995), pan, amp);
out <! LocalOut(car * fb)
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
