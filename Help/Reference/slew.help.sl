# slew

- _slew(in, upSlope, downSlope)_

slew rate limiter.
Limits the slope of an input signal.
The slope is expressed in units per second.

- in: input signal.
- upSlope: maximum upward slope.
- downSlope: maximum downward slope.

slew square wave:

```
let z = lfPulse(800, 0, 0.5) * 0.1;
[z, slew(z, 4000, 4000)]
```

* * *

See also: lag, lagUd

Guides: Unit Generators

Categories: Ugen
