# zeroCrossingRate

- _zeroCrossingRate([x₁ x₂ …])_

Answer the zero-crossing rate of the signal _x_,
the rate at which _x_ changes from positive to zero to negative,
or from negative to zero to positive.

```
>>> let x = [1 -1 1 -1 1 -1 1 -1 1 -1];
>>> x.zeroCrossingRate
1
```

Zero-crossing rate of `sin` signal:

```
>>> let x = (0 -- 24.5.pi).subdivide(96);
>>> let y = x.sin;
>>> (
>>> 	y.zeroCrossingCount,
>>> 	x.size - 1,
>>> 	y.zeroCrossingRate
>>> )
(24, 96, 24 / 96)
```

* * *

See also: zeroCrossingCount, zeroCrossingDetect

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AudioMeasurements.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/zerocrossrate.html)
