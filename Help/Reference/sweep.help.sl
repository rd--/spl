# sweep

- _sweep(trig=0, rate=1)_

Triggered linear ramp.
Starts a linear raise by rate/sec from zero when _trig_ is triggered.

When rate is equal to one, sweep may be used to get a continually-updating measurement of the time (in seconds) since the last trigger.

- trig: start sweep, reset to zero
- rate: raise rate

Using sweep to modulate sine frequency:

```
let trig = impulse(mouseX(0.5, 20, 1, 0.2), 0);
sinOsc(sweep(trig, 700) + 500, 0) * 0.1
```

Using sweep to index into a buffer:

```spl SfAcquire
let trig = impulse(mouseX(0.5, 10, 1, 0.2), 0);
let sf = sfAcquireMono('Floating');
let ph = sweep(trig, bufSampleRate(sf));
bufRd(1, sf, ph, 1, 2)
```

Backwards, variable offset:

```spl SfAcquire
let trig = impulse(mouseX(0.5, 10, 1, 0.2), 0);
let sf = sfAcquireMono('Floating');
let rate = bufSampleRate(sf);
let ph0 = bufFrames(sf) * lfNoise0(0.2);
let ph = sweep(trig, rate.-) + ph0;
bufRd(1, sf, ph, 1, 2)
```

Raising rate:

```spl SfAcquire
let trig = impulse(mouseX(0.5, 10, 1, 0.2), 0);
let sf = sfAcquireMono('Floating');
let rate = sweep(trig, 2) + 0.5;
let ph = sweep(trig, bufSampleRate(sf) * rate);
bufRd(1, sf, ph, 1, 2)
```

* * *

See also: Line, phasor

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Sweep.html)

Categories: Ugen, Trigger
