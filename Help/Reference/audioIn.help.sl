# audioIn

- _audioIn(channelList)_

Sound input.
Read audio input from analogue-to-digital converter,
i.e. the sound input hardware.

- channelList: input channel numbers to read, channel numbers are one-indexed

Stereo through patching from input to output with one second delay:

```
delayN(audioIn([1, 2]), 1, 1)
```

* * *

See also: In, controlIn

Guides: Unit Generators

Categories: Ugen
