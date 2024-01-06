# ControlIn -- read bus

_ControlIn(numChannels, index)_

Control signals may be written to buses by Ugens, or they may be set by the client and expected to hold steady.
Therefore _ControlIn_ does not distinguish between new and old data.

_ControlIn_ always reads the current value on the bus, whether it was:

1. generated earlier in this calculation cycle
2. left over from the previous calculation cycle
3. set by the client

Write signals to control buses, this program does not generate an audio signal:

	ControlOut(0, SinOsc([3 5 7 9] / 11, 0).Range(0, 1).kr)

Read signals from control buses written to by above program:

	SinOsc(ControlIn(4, 0) * 333 + 55, 0).Splay * 0.1

Multiple-channel expansion on index, place reader and writer in same graph:

	let w = ControlOut(0, SinOsc([3 5 7 9] / 11, 0).Range(0, 1).kr);
	SinOsc(ControlIn(1, [0 .. 3]) * 333 + 55, 0).Splay * 0.1 <! w

* * *

See also: AudioIn, ControlOut, In, Out
