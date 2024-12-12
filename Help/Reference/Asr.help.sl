# Asr

- Asr(gate, attackTime, releaseTime, curve)

Attack-sustain-release envelope.

```
let gate = LfPulse(0.5, 0, 0.1) > 0;
let env = Asr(gate, 0.05, 0.7, 0);
SinOsc(440, 0) * env * 0.1
```

* * *

See also: Adsr, EnvGen, Perc

Categories: Ugen, Envelope
