# feedforwardFeedbackward

- _feedforwardFeedbackward(in, forward/2, backward/1)_

Generate a feed-forward, feed-backward network by introducing a delay of one `blockSize`.
The network allocates a buffer to hold the block delay, and specifies a maximum allowed block size of 512 places.

For each channel _c_ of _in_,
the _forward_ block receives _c_ and the delayed output of _backward_,
and the _backward_ block receives the output of _forward_.
Both _forward_ and _backward_ must answer a `Ugen`, not a `List`.

A simple feedback delay network, the _forward_ block is `+`,
the _backward_ block introduces a delay of a little over one second:

~~~spl syn=A
feedforwardFeedbackward(
	sinOsc(
		lfNoise2(1 / [7, 9]).linLin(
			-1, 1, 222, 555
		),
		0
	) * 0.1,
	+,
	{ :x |
		delayC(x, 1.141, 1.141) * 0.7
	}
) * 0.5
~~~

* * *

See also: <!, bufAlloc, bufClear, delayTap, delayWrite

Guides: Unit Generators

Categories: Ugen
