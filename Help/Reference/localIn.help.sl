# localIn

- _localIn(numChannels, defaultValues)_

Define and read from an audio bus local to the enclosing synth.

- numChannels: the number of channels (i.e. adjacent buses) to read
- defaultValues: initial values on buses

localIn defines buses that are local to the enclosing synth.

These are like the global buses, but are more convenient if you want to implement a self contained effect that uses a feedback processing loop.

There can only be one audio rate and one control rate `localIn` per synthesis program.

The audio can be written to the bus using `localOut`.

Audio written to a localOut will not be read by a corresponding localIn until the next cycle, i.e. one block size of samples later.

Simple delay with reversed channels sent to `localOut` to give ping pong effect, mouse control of decay factor:

~~~spl syn=A
let source = decay(
	impulse(0.3, 0),
	0.1
) * whiteNoise() * 0.2;
let local = localIn(2, [0 0]) + [source, 0];
let delayed = delayN(local, 0.2, 0.2);
let x = mouseX(0, 1, 0, 0.2);
delayed <! localOut(
	delayed.reverse * x
)
~~~

* * *

See also: localOut

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LocalIn.html)

Categories: Ugen
