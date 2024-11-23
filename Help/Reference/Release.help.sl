# Release

- _Release(in, attackTime=1, sustainTime=1, releaseTime=1)_

Envelope generator.
Apply a three stage envelope to _in_ and release the synthesis node once the envelope is ended.

```
let counter = PinkNoise() * Decay(Impulse(1, 0), 0.1) * 0.1;
Release(SinOsc(440, 0) * 0.1, 3, 3, 5) + counter
```

* * *

See also: Asr, Cutoff

Categories: Ugen
