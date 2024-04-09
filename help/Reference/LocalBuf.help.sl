# LocalBuf

- _LocalBuf(numChannels, numFrames)_

Allocate a buffer local to the synth

- numChannels: number of channels for multiple channel buffers (default: 1)
- numFrames: number of frames (default: 1)

_LocalBuf_ outputs a buffer number.
Most but not all Ugens that require a buffer number input accept local buffers.

* * *

See also: asLocalBuf, ClearBuf, SetBuf

Categories: Buffer
