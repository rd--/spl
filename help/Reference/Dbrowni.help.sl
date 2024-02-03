# Dibrown

Noise generator.

_Dibrown(length, lo, hi, step)_

- length: number of values to create
- lo: minimum value
- hi: maximum value
- step: maximum step for each new value

Demand rate brownian movement generator.
_Dibrown_ answers numbers in the continuous range between lo and hi.
The arguments can be a number or any other ugen.

```
let a = Dibrown(inf, 0, 15, 1);
let trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
let freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Demand, Dbrown, Dwhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Dibrown.html)

Categories: Ugen, Noise, Demand
