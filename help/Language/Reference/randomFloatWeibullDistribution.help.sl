# randomFloatWeibullDistribution

_randomFloatWeibullDistribution(location, spread, shape)_

- location: offset
- spread: distribution range scaling factor
- shape: curve shaping parameter

This is a complex, yet powerful, distribution relying on 3 parameters.
These are known as the location, spread, and shape parameters.
The 'location' and 'spread' parameters are used interchangeably to set the mean.
The 'shape' parameter alters the curve of the distribution.

Effects of 'shape':

- 0 < 'shape' <= 1: occurance of values near 'location' increases as 'shape' -> 0
- 'shape' = 1: same as exponential distribution


	({ randomFloatWeibullDistribution(0, 1, 3 / 4) } ! 99).plot
