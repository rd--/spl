# bilinearInterpolation

- _bilinearInterpolation(q11, q21, q12, q22, mu1, mu2)_

Calculate an interpolated point that lies between the four points _q11_, _q21_, _q12_ and _q22_ at _(mu1,mu2)_.

```
>>> bilinearInterpolation(
>>> 	[1 1], [2 1],
>>> 	[1 2], [2 2],
>>> 	2/3, 4/5
>>> )
[5/3 9/5]
```

* * *

See also: catmullRomInterpolation, cosineInterpolation, cubicInterpolation, hermiteInterpolation, linearInterpolation, matrixInterpolation, matrixResample, trilinearInterpolation

Guides: Interpolation Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Bilinear_interpolation)
