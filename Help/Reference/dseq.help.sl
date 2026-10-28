# dseq

- _dseq(repeats=1, list)_

Sequence generator.

- repeats: number of repeats
- list: a list of values or other Ugens

demand rate sequence generator.

Repeat sequence three times, mouse control of request frequency:

```
let seq = dseq(3, [1 3 2 7 8]);
let trig = impulse(mouseX(1, 40, 1, 0.2), 0);
let freq = demand(trig, 0, seq) * 30 + 340;
sinOsc(freq, 0) * 0.1
```

Infinite repetitions of sequence of thirty-two random numbers,
mouse control of request frequency with range into audio rate:

```
let seq = dseq(Infinity, { iRand(0, 10) } ! 32);
let trig = impulse(mouseX(1, 10000, 1, 0.2), 0);
let freq = demand(trig, 0, seq) * 30 + 340;
sinOsc(freq, 0) * 0.1
```

* * *

See also: demand, duty, tDuty

Guides: Unit Generators

Categories: Ugen
