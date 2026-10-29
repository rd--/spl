# controlIn

- _controlIn(numChannels, index)_

Read control bus.
Control signals may be written to buses by Ugens, or they may be set by the client and expected to hold steady.
Therefore `controlIn` does not distinguish between new and old data.

`controlIn` always reads the current value on the bus, whether it was:

1. generated earlier in this calculation cycle
2. left over from the previous calculation cycle
3. set by the client

Write signals to control buses,
this program does not generate an audio signal:

~~~spl syn=A
controlOut(
	0,
	sinOsc(
		[3 5 7 9] / 11,
		0
	).linLin(-1, 1, 0, 1).kr
)
~~~

Read signals from control buses written to by above program:

~~~spl syn=B
sinOsc(
	controlIn(4, 0) * 333 + 55,
	0
).splay * 0.1
~~~

Multiple-channel expansion on index, place reader and writer in same graph:

~~~spl syn=C
let w = controlOut(
	0,
	sinOsc(
		[3 5 7 9] / 11,
		0
	).linLin(-1, 1, 0, 1).kr
);
sinOsc(
	controlIn(1, [0 .. 3]) * 333 + 55,
	0
).splay * 0.1 <! w
~~~

* * *

See also: In, audioIn, controlOut, out

Guides: Unit Generators

Categories: Ugen
