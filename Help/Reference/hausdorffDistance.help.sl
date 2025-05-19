# hausdorffDistance

- _hausdorffDistance(u, v, f:/2)_

The Hausdorff distance,
also called Pompeiu–Hausdorff distance,
measures how far two subsets of a metric space are from each other.

```
>>> let u = [1 0; 0 1; -1 0; 0 -1];
>>> let v = [2 0; 0 2; -2 0; 0 -4];
>>> let a = directedHausdorffMetric(u, v);
>>> let b = directedHausdorffMetric(v, u);
>>> let c = hausdorffDistance(u, v);
>>> (a, b, c)
([2.236 4 1], [3 4 4], 3)

>>> let u = [1 1; 1 2];
>>> let v = [[3 4]];
>>> hausdorffDistance(u, v)
13.sqrt

>>> let u = [0 0; 1 1];
>>> let v = [-1 1; 2 0];
>>> hausdorffDistance(u, v)
2.sqrt

>>> let u = [0 -1 2; 2 -1 -3];
>>> let v = [-1 1 3; 2 -1 0];
>>> hausdorffDistance(u, v)
3

>>> let u = [0 0; 2 1; 1 3];
>>> let v = [2 0; 0 3; -1 1];
>>> hausdorffDistance(u, v)
2.sqrt

>>> let u = [0 0 0; 2 0 0; 0 2 0; 0 0 2];
>>> let v = [-1 0 1; 2 0 1; 3 2 0; 2 0 2];
>>> hausdorffDistance(u, v)
2.4495

>>> let u = [0 0; 1 2; 4 3];
>>> let v = [4 2; 3 0];
>>> hausdorffDistance(u, v)
3
```

* * *

See also: euclideanDistance

Guides: Distance Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RegionHausdorffDistance.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.distance.directed_hausdorff.html),
_W_
[1](https://en.wikipedia.org/wiki/Hausdorff_distance)
