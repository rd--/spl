# offsetOut

- _offsetOut(bus, channelsList)_

Write a signal to a bus with sample accurate timing.

- bus: The index of the bus to write to, the lowest numbers correspond to the audio hardware
- channelsList: The list of channels to write out

Define a simple unit generator graph:

~~~spl scsynth
let ctl = (
	freq: 440,
	amp: 0.1,
	sustain: 1
).localControls;
let osc = sinOsc(ctl['freq'], 0);
let env = sine(1, ctl['sustain']).freeSelfWhenDone;
UgenGraph(
	'sin',
	offsetOut(0, osc * env * ctl['amp'])
).send
~~~

Schedule overlapping copies of the graph above:

~~~spl scheduler
let freq = 555;
LsBind(
	instrument: 'sin',
	freq: freq,
	dur: 10 / freq,
	sustain: 20 / freq
).play
~~~

* * *

See also: out

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/OffsetOut.html)

Categories: Ugen
