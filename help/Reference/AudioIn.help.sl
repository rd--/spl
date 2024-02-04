# AudioIn

Sound input.
Read audio input from analogue-to-digital converter.

_AudioIn(channelList)_

Reads audio from the sound input hardware.

- channelList: input channel numbers to read, channel numbers are one-indexed

Stereo through patching from input to output with one second delay:

```
DelayN(AudioIn([1, 2]), 1, 1)
```

* * *

See also: ControlIn, In
