# xyzToLab

- _xyzToLab(xyz)_
- _xyzToLab(xyz, whiteReference)_

With standard (D65) white reference:

```
>>> [25 40 10].xyzToLab
[69.4695 -48.0439 57.1259]

>>> [69.4695 -48.0439 57.1259].labToXyz
[25 40 10]

>>> [20.654 12.197 5.137].xyzToLab
[41.527 52.636 26.916]
```

With specified white references:

```
>>> let d50 = [96.4212 100 82.5188];
>>> let xyz = [25 40 10];
>>> let lab = xyz.xyzToLab(d50);
>>> (xyz, lab, lab.labToXyz(d50))
(
	[25 40 10],
	[69.4695 -49.5717 48.3864],
	[25 40 10]
)

>>> [36.151 20.801 2.655].xyzToLab(
>>> 	[96.42 100.003 82.489]
>>> )
[52.7303 64.2894 54.8817]

>>> [19.4100 28.4100 11.5766].xyzToLab(
>>> 	[94.811 100 107.304]
>>> )
[60.2574 -34.0099 36.2677]
```

* * *

See also: Colour, labToXyz

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/xyz2lab.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.XYZ_to_Lab.html)
