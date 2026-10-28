# bufFrames

- _bufFrames(bufNum)_

Read the current number of frames allocated in the buffer.

- bufNum: Buffer index.

Note: A buffer can be reallocated at any time, the frame count can change at any time.

Indexing with a phasor:

```spl SfAcquire
let sf = sfAcquireMono('Floating');
let ph = phasor(
	0,
	bufRateScale(sf),
	0,
	bufFrames(sf),
	0
);
bufRd(1, sf, ph, 1, 2)
```

Indexing by hand:

```spl SfAcquire
let sf = sfAcquireMono('Floating');
let ph = mouseX(
	0,
	bufFrames(sf),
	0,
	0.2
).k2A;
bufRd(1, sf, ph, 1, 2)
```

* * *

See also: bufChannels, bufDur, bufRateScale, bufSampleRate, bufSamples

Guides: Unit Generators

Categories: Ugen, Buffer
