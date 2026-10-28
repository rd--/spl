# tExpRand

- _tExpRand(lo=0, hi=1, tr=0)_

Triggered exponential random number generator.
Generates a random float value in exponential distribution from _lo_ to _hi_ each time the _trig_ signal is set.
_lo_ and _hi_ must both have the same sign and be non-zero.

```
let tr = dust(10);
sinOsc(tExpRand(300, 3000, tr), 0) * 0.1
```

Mouse controls density:

```
let tr = dust(mouseX(1, 8000, 1, 0.2));
sinOsc(tExpRand(300, 3000, tr), 0) * 0.1
```

* * *

See also: expRand

Guides: Unit Generators

Categories: Ugen
