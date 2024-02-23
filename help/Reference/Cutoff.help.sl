# Cutoff

- _Cutoff(sustainTime, decayTime, curve)_

Apply a cutoff envelope to a continuous sound.

- sustainTime: sustain portion of the envelope
- decayTime: decay portion of the envelope
- curve: shape of envelope segment

Cutoff sine oscillator after four seconds with one second release time:

```
Cutoff(4, 1, -4) * SinOsc(220, 0) * 0.1
```

* * *

See also: Release

Categories: Ugen, Envelope
