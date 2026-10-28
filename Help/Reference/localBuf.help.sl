# localBuf

- _localBuf(numChannels, numFrames)_

Allocate a buffer local to the synth

- numChannels: number of channels for multiple channel buffers (default: 1)
- numFrames: number of frames (default: 1)

_localBuf_ outputs a buffer number.
Most but not all Ugens that require a buffer number input accept local buffers.
Make a local buffer from a list or matrix of numbers.

At `List`, answer an initialized local buffer:

```
let b = [
	0 2 3 5 7 8 10 12
].localBuf;
let x = mouseX(0, 8, 0, 0.2);
let m = bufRd(1, b, x, 1, 1) + 48;
sinOsc(m.midiCps, 0) * 0.1
```

In the matrix case the buffer will have multiple channels.

```
let b = [
	0 2 3 5;
	12 10 8 7
].localBuf;
let x = mouseX(0, 4, 0, 0.2);
let m = bufRd(1, b, x, 1, 1) + 48;
sinOsc(m.midiCps, 0) * 0.1
```

* * *

See also: clearBuf, setBuf

Guides: Unit Generators

Categories: Buffer
