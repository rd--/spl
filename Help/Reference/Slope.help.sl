# Slope

- _Slope(in)_

Slope of signal.
Measures the rate of change per second of a signal.

- in: input signal to measure.

Formula implemented is:

> _out[i] = (in[i] - in[i-1]) * samplingRate_

Noise and derivatives control frequency of sine oscillator.
_a_ is quadratic noise,
_b_ is the first derivative and produces line segments,
_c_ is the second derivative and produces constant segments,
the derivatives must be scaled back to ±1:

```
let a = LfNoise2(2);
let b = Slope(a);
let c = Slope(b);
let scale = 0.2;
let freq = [
	a,
	b * scale,
	c * scale.squared
] * 100 + 200;
SinOsc(freq, 0).Splay * 0.1
```

For another example of `Slope` see `Hypotenuse`.

* * *

See also: Integrator

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Slope.html)

Categories: Ugen
