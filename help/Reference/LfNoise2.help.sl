# LfNoise2

- _LfNoise2(freq)_

Quadratic noise.
Generates quadratically interpolated random values at a rate given by the nearest integer division of the sample rate by the freq argument.

- freq: approximate rate at which to generate random values.

Fixed frequency:

```
LfNoise2(1000) * 0.05
```

Modulate frequency:

```
LfNoise2(XLine(1000, 10000, 10)) * 0.05
```

* * *

See also: LfNoise0, LfNoise1

Categories: Noise
