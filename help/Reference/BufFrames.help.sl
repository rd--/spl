# BufFrames

- _BufFrames(bufNum)_

Read the current number of frames allocated in the buffer.

- bufNum: Buffer index.

Note: A buffer can be reallocated at any time, the frame count can change at any time.

Indexing with a phasor:

```
let sf = SfAcquireMono('Floating');
BufRd(1, sf, Phasor(0, BufRateScale(sf), 0, BufFrames(sf), 0), 1, 2)
```

Indexing by hand:

```
let sf = SfAcquireMono('Floating');
BufRd(1, sf, MouseX(0, BufFrames(sf), 0, 0.2).K2A, 1, 2)
```

* * *

See also: BufChannels, BufDur, BufRateScale, BufSampleRate, BufSamples

Categories: Buffer
