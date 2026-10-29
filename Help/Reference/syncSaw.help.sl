# syncSaw

- _syncSaw(ksyncFreq, ksawFreq)_

Hard sync sawtooth wave.
A sawtooth wave that is hard synched to a fundamental pitch.
This produces an effect similar to moving formants or pulse width modulation.
The sawtooth oscillator has its phase reset when the sync oscillator completes a cycle.
This is not a band limited waveform, so it may alias.

- ksyncFreq: frequency of the fundamental.
- ksawFreq: frequency of the slave synched sawtooth wave. sawFreq should always be greater than syncFreq.

Modulate saw frequency:

~~~spl syn=A
syncSaw(100, line(100, 800, 12)) * 0.1
~~~

Modulate saw frequency with mouse (view is oscilloscope, `impulse` shows sync frequency):

~~~spl syn=B
let freq = 400;
[
	syncSaw(freq, freq * mouseX(1, 3, 0, 0.2)),
	impulse(freq, 0)
] * 0.1
~~~

Mouse control of each frequency input:

~~~spl syn=C
syncSaw(
	mouseX(1, 400, 0, 0.2),
	mouseY(400, 800, 0, 0.2)
) * 0.05
~~~

* * *

See also: lfSaw, saw, varSaw

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SyncSaw.html)

Categories: Ugen, Oscillator
