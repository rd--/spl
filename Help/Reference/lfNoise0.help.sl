# lfNoise0

- _lfNoise0(freq)_

Step noise.
Generates random values at a rate given by the nearest integer division of the sample rate by the freq argument.

- freq: approximate rate at which to generate random values.

Fixed frequency:

```
lfNoise0(1000) * 0.05
```

Modulate frequency:

```
lfNoise0(xLine(1000, 10000, 10)) * 0.05
```

* * *

See also: lfNoise1, lfNoise2

Guides: Unit Generators

Categories: Ugen
