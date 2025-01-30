# Sweep

- _Sweep(trig=0, rate=1)_

Triggered linear ramp.
Starts a linear raise by rate/sec from zero when _trig_ is triggered.

When rate is equal to one, Sweep may be used to get a continually-updating measurement of the time (in seconds) since the last trigger.

- trig: start sweep, reset to zero
- rate: raise rate

Using sweep to modulate sine frequency:

```
let trig = Impulse(MouseX(0.5, 20, 1, 0.2), 0);
SinOsc(Sweep(trig, 700) + 500, 0) * 0.1
```

Using sweep to index into a buffer:

```
let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('Floating');
let ph = Sweep(trig, BufSampleRate(sf));
BufRd(1, sf, ph, 1, 2)
```

Backwards, variable offset:

```
let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('Floating');
let rate = BufSampleRate(sf);
let ph0 = BufFrames(sf) * LfNoise0(0.2);
let ph = Sweep(trig, rate.Minus) + ph0;
BufRd(1, sf, ph, 1, 2)
```

Raising rate:

```
let trig = Impulse(MouseX(0.5, 10, 1, 0.2), 0);
let sf = SfAcquireMono('Floating');
let rate = Sweep(trig, 2) + 0.5;
let ph = Sweep(trig, BufSampleRate(sf) * rate);
BufRd(1, sf, ph, 1, 2)
```

* * *

See also: Line, Phasor

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Sweep.html)

Categories: Ugen, Trigger
