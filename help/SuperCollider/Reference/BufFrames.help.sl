# BufFrames -- buffer

Read the current number of frames allocated in the buffer.

_BufFrames(bufNum)_

Get the current number of allocated frames.

- bufNum: Buffer index.

Note: A buffer can be reallocated at any time, the frame count can change at any time.

Indexing with a phasor:

	var sf = SfAcquireMono('floating_1');
	BufRd(1, sf, Phasor(0, BufRateScale(sf), 0, BufFrames(sf), 0), 1, 2)

Indexing by hand:

	var sf = SfAcquireMono('floating_1');
	BufRd(1, sf, MouseX(0, BufFrames(sf), 0, 0.2).K2A, 1, 2)

* * *

See also: BufChannels, BufDur, BufRateScale, BufSampleRate, BufSamples
