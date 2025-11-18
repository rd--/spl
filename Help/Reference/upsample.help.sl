# upsample

- _upsample([x₁ x₂ …], n)_

Answer an upsampled copy of the sequence _x_ by inserting _n-1_ zeros after each element.

Upsample a `List` by a factor of three:

```
>>> [1 2 3].upsample(3)
[1 0 0 2 0 0 3 0 0]
```

Upsample a `List` by a factor of two:

```
>>> [1 3 5 4 2].upsample(2)
[1 0 3 0 5 0 4 0 2 0]
```

* * *

See also: downsample, resample

Guides: Interpolation Functions, Signal Processing Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Upsample.html)
_W_
[1](https://en.wikipedia.org/wiki/Upsampling)

Categories: Rearranging
