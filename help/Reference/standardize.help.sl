# standardize

- _standardize(aSequence, meanBlock:/1, deviationBlock:/1)_
- _standardize(alpha)_ ⟹ _standardize(alpha, mean:/1, standardDeviation:/1)_

Shifts and rescales the elements of _aSequence_ to have zero mean and unit sample variance.

_standardize(x) = (x - x.meanBlock) / x.deviationBlock_,
for non-zero deviation.

Compute standard scores for data:

```
>>> [6.5 3.8 6.6 5.7 6.0 6.4 5.3].standardize
[0.7571, -1.9945, 0.859, -0.05823, 0.2475,  0.6551,  -0.4659]

>>> let r = [6.5 3.8 6.6 5.7 6.0 6.4 5.3].standardize;
>>> (r.mean, r.variance)
(0, 1)
```

Shift to have mean zero without scaling:

```
>>> 1:10.standardize(mean:/1, { :unused | 1 })
[-4.5 -3.5 -2.5 -1.5 -0.5 0.5 1.5 2.5 3.5 4.5]

>>> let r = 1:10.standardize(mean:/1, { :unused | 1 });
>>> (r.mean, r.variance)
(0, 9.1667)
```

Shift by the Median and scale by the InterquartileRange:

```
> 1:10.standardize(median:/1, interquartileRange:/1)
[-0.9 -0.7 -0.5 -0.3 -0.1 0.1 0.3 0.5 0.7 0.9]
```

* * *

See also: rescale

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Standardize.html)

Categories: Math, Vector

