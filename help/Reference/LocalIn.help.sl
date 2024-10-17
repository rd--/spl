# LocalIn

- _LocalIn(numChannels, defaultValues)_

Define and read from an audio bus local to the enclosing synth.

- numChannels: the number of channels (i.e. adjacent buses) to read
- defaultValues: initial values on buses

LocalIn defines buses that are local to the enclosing synth.

These are like the global buses, but are more convenient if you want to implement a self contained effect that uses a feedback processing loop.

There can only be one audio rate and one control rate `LocalIn` per synthesis program.

The audio can be written to the bus using `LocalOut`.

Audio written to a LocalOut will not be read by a corresponding LocalIn until the next cycle, i.e. one block size of samples later.

Simple delay with reversed channels sent to `LocalOut` to give ping pong effect, mouse control of decay factor:

```
/* LocalIn ; read feedback, add to source */
let source = Decay(Impulse(0.3, 0), 0.1) * WhiteNoise() * 0.2;
let local = LocalIn(2, [0 0]) + [source, 0];
let delayed = DelayN(local, 0.2, 0.2);
delayed <! LocalOut(delayed.reversed * MouseX(0, 1, 0, 0.2))
```

* * *

See also: LocalOut
