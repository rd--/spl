# Dseq

Sequence generator.

_Dseq(repeats=1, list)_

- repeats: number of repeats
- list: a list of values or other Ugens

Demand rate sequence generator.

Repeat sequence three times, mouse control of request frequency:

```
let seq = Dseq(3, [1 3 2 7 8]);
let trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
let freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

Infinite repetitions of sequence of thirty-two random numbers,
mouse control of request frequency with range into audio rate:

```
let seq = Dseq(inf, { IRand(0, 10) } ! 32);
let trig = Impulse(MouseX(1, 10000, 1, 0.2), 0);
let freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Demand, Duty, TDuty

Categories: Ugen
