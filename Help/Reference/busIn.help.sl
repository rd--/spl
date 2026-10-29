# busIn

- _busIn(numChannels, bus)_

Read a signal from a bus.

- bus: the index of the bus to read in from
- numChannels: the number of adjacent buses to read

`busIn` reads signals from consecutive buses.
Audio and control buses behave differently with respect to signals left on the bus in the previous calculation cycle.

`busIn` can access audio signals that were generated in the current calculation cycle by synthesis nodes located earlier in the node tree.
It does not read signals left on an audio bus from the previous calculation cycle.
`inFeedback` supports audio signal feedback.

The hardware input busses begin just after the hardware output busses.
The number of hardware input and output busses can vary depending on the synthesiser parameters.

Read and delay the first two hardware input channels:

~~~spl syn=A
delayN(busIn(2, numOutputBuses()), 2, 2)
~~~

Write and then read from an audio bus:

~~~spl syn=B
out(10, pinkNoise() * 0.1)
<! out(0, busIn(1, 10))
~~~

One two channel `busIn`, delayed by one second:

~~~spl syn=C
delayN(
	busIn(2, numOutputBuses()),
	1,
	1
)
~~~

Two single channel `busIn` nodes, each delayed by one second:

~~~spl syn=D
delayN(
	busIn(1, numOutputBuses() + [0, 1]),
	1,
	1
)
~~~

* * *

See also: audioIn, controlIn, inFeedback, out

Guides: Unit Generators

Categories: Ugen
