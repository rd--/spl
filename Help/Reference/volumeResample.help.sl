# volumeResample

- _volumeResample(aVolume, shape)_

Answer a volume that is the trilinear resampling of _aVolume_ to have the specified _shape_.

Resample a 2×2×2 volume to a 3×3×3 volume:

```
>>> [2 2 2].iota
>>> .volumeResample([3 3 3])
[
	1 1.5 2;
	2 2.5 3;
	3 3.5 4
	:;
	3 3.5 4;
	4 4.5 5;
	5 5.5 6
	:;
	5 5.5 6;
	6 6.5 7;
	7 7.5 8
]
```

The answer volume need not have the same proportions as the initial volume.
Resample a 2×2×2 volume to a 3×2×3 volume:

```
>>> [2 2 2].iota
>>> .volumeResample([3 2 3])
[
	1 1.5 2;
	3 3.5 4
	:;
	3 3.5 4;
	5 5.5 6
	:;
	5 5.5 6;
	7 7.5 8
]
```

* * *

See also: trilinearInterpolation, matrixResample, resample, volumeInterpolation

Guides: Interpolation Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayResample.html),
_Mathworks_
[1](https://au.mathworks.com/help/matlab/ref/interp3.html)
