# labToXyz

- _labToXyz(xyz)_
- _labToXyz(xyz, whiteReference)_

With default (D65) white reference:

```
>>> [69.4695 -48.0439 57.1259].labToXyz
[25 40 10]

>>> [50 10 -5].labToXyz
[19.419 18.419 22.816]
```

With specified (D50) white references:

```
>>> let d50 = [96.4212 100 82.5188];
>>> [50 10 -5].labToXyz(d50)
[19.699 18.419 17.292]
```

* * *

See also: Colour, xyzToLab

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/lab2xyz.html)
