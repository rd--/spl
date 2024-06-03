# randomFloatGaussianDistribution

Generates a bell-shaped curve centered around mean.
Good for simulating life-like behavior and mutations.
Also known as _Normal Distribution_.

- mean: mean value
- deviation: determines the spread of values above and below mean

Mean at zero, small deviation:

~~~
({ system.randomFloatGaussianDistribution(0, 1 / 9) } ! 99).plot
~~~

Plot sorted random list:

```
({ system.randomFloatGaussianDistribution(0, 1) } ! 500).sort.plot
```

* * *

See also: randomFloat

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NormalDistribution.html),
_W_
[1](https://en.wikipedia.org/wiki/Normal_distribution)
