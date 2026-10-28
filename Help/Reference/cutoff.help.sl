# cutoff

- _cutoff(sustainTime, decayTime, curve)_

Apply a cutoff envelope to a continuous sound.

- sustainTime: sustain portion of the envelope
- decayTime: decay portion of the envelope
- curve: shape of envelope segment

cutoff sine oscillator after four seconds with one second release time:

```
cutoff(4, 1, -4) * sinOsc(220, 0) * 0.1
```

* * *

See also: release

Guides: Unit Generators

Categories: Ugen, Envelope
