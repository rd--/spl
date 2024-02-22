# randomFloatWeibullDistribution

_randomFloatWeibullDistribution(location, spread, shape)_

- location: offset
- spread: distribution range scaling factor
- shape: curve shaping parameter

This is a complex, yet powerful, distribution relying on 3 parameters.
These are known as the location, spread, and shape parameters.
The _location_ and _spread_ parameters are used interchangeably to set the mean.
The _shape_ parameter alters the curve of the distribution.

Effects of _shape_:

- 0 < _shape_ <= 1: occurance of values near _location_ increases as _shape_ -> 0
- _shape_ = 1: same as exponential distribution

~~~
({ randomFloatWeibullDistribution(0, 1, 3 / 4) } ! 99).plot
~~~
