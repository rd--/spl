# zeroCrossingRate

- _zeroCrossingRate(list)_

```
>>> let x = [1 -1 1 -1 1 -1 1 -1 1 -1];
>>> x.zeroCrossingRate
1
```

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
[1](https://mathworld.wolfram.com/x.html)
_Mathworks_
[1](https://mathworks.com/help/signal/ref/zerocrossrate.html)
