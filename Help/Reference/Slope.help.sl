# Slope

- _Slope(in)_

Slope of signal.
Measures the rate of change per second of a signal.

- in: input signal to measure.

Formula implemented is:

> _out[i] = (in[i] - in[i-1]) * samplingRate_

Noise and derivatives control frequency of sine oscillator:

```
/* quadratic noise */
let a = LfNoise2(2);
/* first derivative produces line segments */
let b = Slope(a);
/* second derivative produces constant segments */
let c = Slope(b);
/* needed to scale back to +/- 1.0 */
let scale = 0.2;
let freq = [a, b * scale, c * scale.squared] * 100 + 200;
SinOsc(freq, 0).Splay * 0.1
```

For another example of `Slope` see `Hypot`.

* * *

See also: Integrator

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Slope.html)

Categories: Ugen
