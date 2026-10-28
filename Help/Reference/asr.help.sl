# asr

- asr(gate, attackTime, releaseTime, curve)

Attack-sustain-release envelope.

```
let gate = lfPulse(0.5, 0, 0.1) > 0;
let env = asr(gate, 0.05, 0.7, 0);
sinOsc(440, 0) * env * 0.1
```

* * *

See also: adsr, envGen, perc

Guides: Unit Generators

Categories: Ugen, Envelope
