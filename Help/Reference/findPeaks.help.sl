# findPeaks

- _findPeaks([x₁ x₂ …])_

Answer the positions and values of the detected peaks in the list _x_.

Find position and height of dominant peaks in a list:

```
>>> [5 3 1 3 5 7 9 7 5 3 1 3 5]
>>> .findPeaks
[1 5; 7 9; 13 5]

>>> [25 8 15 5 6 10 10 3 1 20 7]
>>> .findPeaks
[1 25; 3 15; 6 10; 10 20]
```

Only the first index of each plateau is recorded:

```
>>> [1 3 5 6 6 4 3 2 4 7 3 2 4 2 2 1]
>>> .findPeaks
[4 6; 10 7; 13 4]
```

Find peaks of cosine function:

```
>>> (-2.pi -- 2.pi).subdivide(100)
>>> .cos
>>> .findPeaks
[1 1; 51 1; 100 0.9921]
```

* * *

See also: maxDetect, peakDetect

Guides: Feature Detection Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FindPeaks.html),
_Mathworks_
[1](https://mathworks.com/help/signal/ref/findpeaks.html)
