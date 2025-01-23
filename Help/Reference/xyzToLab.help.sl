# xyzToLab

- _xyzToLab(xyz)_
- _xyzToLab(xyz, whiteReference)_

With standard (D65) white reference:

```
>>> [0.25 0.40 0.10].xyzToLab
[69.4695 -48.0439 57.1259]

>>> [0.20654 0.12197 0.05137].xyzToLab
[41.527 52.636 26.916]
```

Inverse is `labToXyz`:

```
>>> [69.4695 -48.0439 57.1259].labToXyz
[0.25 0.40 0.10]
```

With specified white references:

```
>>> let d50 = [96.4212 100 82.5188];
>>> let xyz = [0.25 0.40 0.10];
>>> let lab = xyz.xyzToLab(d50);
>>> (xyz, lab, lab.labToXyz(d50))
(
	[0.25 0.40 0.10],
	[69.4695 -49.5717 48.3864],
	[0.25 0.40 0.10]
)

>>> [0.36151 0.20801 0.02655].xyzToLab(
>>> 	[96.42 100.003 82.489]
>>> )
[52.7303 64.2894 54.8817]

>>> [0.194100 0.284100 0.115766].xyzToLab(
>>> 	[94.811 100 107.304]
>>> )
[60.2574 -34.0099 36.2677]
```

* * *

See also: Colour, labToXyz

Guides: Colour Functions

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/xyz2lab.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.XYZ_to_Lab.html)
