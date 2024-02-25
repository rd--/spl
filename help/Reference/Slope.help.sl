# Slope

- _Slope(in)_

Slope of signal.
Measures the rate of change per second of a signal.
Formula implemented is:

> _out[i] = (in[i] - in[i-1]) * samplingRate_

- in: input signal to measure.

Noise and derivatives control frequency of sine oscillator:

```
{- quadratic noise -}
let a = LfNoise2(2);
{- first derivative produces line segments -}
let b = Slope(a);
{- second derivative produces constant segments -}
let c = Slope(b);
{- needed to scale back to +/- 1.0 -}
let scale = 0.2;
let freq = [a, b * scale, c * scale.squared] * 100 + 200;
SinOsc(freq, 0).Splay * 0.1
```

For another example of Slope see `Hypot`.

* * *


Categories: Ugen
