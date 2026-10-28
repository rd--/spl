# slope

- _slope(in)_

slope of signal.
Measures the rate of change per second of a signal.

- in: input signal to measure.

Formula implemented is:

> _y[n] = (x[n] - x[n-1]) * fs_

Noise and derivatives control frequency of sine oscillator.
_a_ is quadratic noise,
_b_ is the first derivative and produces line segments,
_c_ is the second derivative and produces constant segments,
the derivatives must be scaled back to ±1:

```
let a = lfNoise2(2);
let b = slope(a);
let c = slope(b);
let scale = 0.2;
let freq = [
	a,
	b * scale,
	c * scale.square
] * 100 + 200;
sinOsc(freq, 0).splay * 0.1
```

For another example of `slope` see `hypotenuse`.

* * *

See also: differences, integrator

Guides: Unit Generators

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Slope.html),
_Max_
[1](https://docs.cycling74.com/reference/gen_dsp_delta/),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Slope.html),
_W_
[1](https://en.wikipedia.org/wiki/Differentiator)
[2](https://en.wikipedia.org/wiki/Slope)

Categories: Ugen
