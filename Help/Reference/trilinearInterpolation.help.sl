# trilinearInterpolation

- _trilinearInterpolation(c000, c100, c010, c110, c001, c101, c011, c111, mu1, mu2, mu3)_

Trilinear interpolation is a method of multivariate interpolation on a three-dimensional regular grid.
It approximates the value of a function at an intermediate point _(x, y, z)_ within the local axial rectangular prism linearly,
using function data on the lattice points.

```
>>> let f = { :i |
>>> 	let [mu1, mu2, mu3] = i;
>>> 	trilinearInterpolation(
>>> 		[0 0 0], [1 0 0], [0 1 0], [1 1 0],
>>> 		[0 0 1], [1 0 1], [0 1 1], [1 1 1],
>>> 		mu1, mu2, mu3
>>> 	)
>>> };
>>> [
>>> 	0.25 0.5 0.5;
>>> 	0.5 0.25 0.5;
>>> 	0.5 0.5 0.25
>>> ].collect(f:/1)
[
	0.25 0.5 0.5;
	0.5 0.25 0.5;
	0.5 0.5 0.25
]
```

* * *

See also: linearInterpolation, bilinearInterpolation, volumeResample

References:
_W_
[1](https://en.wikipedia.org/wiki/Trilinear_interpolation)
