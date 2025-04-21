# centralFeature

- _centralFeature(x, f:/2)_

Answer the central feature of the elements,
utilising the specified distance function _f_.

Find the central feature in a list of vectors:

```
>>> [1 3 5; 7 1 2; 9 3 1; 4 5 6]
>>> .centralFeature(euclideanDistance:/2)
[7 1 2]

>>> [1 2; 3 4; 8 7; 6 5; 9 4; 1 3]
>>> .centralFeature(euclideanDistance:/2)
[3 4]
```

Compute the central feature of strings:

```
>>> ['abcd' 'bcde' 'abab' 'abcdef' 'agi']
>>> .centralFeature(editDistance:/2)
'abcd'
```

Compute the central feature of Boolean vectors:

```
>>> [1 0 1; 1 1 1; 1 0 0; 0 0 0]
>>> .centralFeature(jaccardDissimilarity:/2)
[1 0 1]
```

The `chessboardDistance` only takes into account the dimension with the largest separation:

```
>>> [1 3; -26 4; 92 5; 73 -5]
>>> .centralFeature(chessboardDistance:/2)
[1 3]

>>> [1 3; -26 4; 92 5; 73 -5]
>>> .centralFeature(canberraDistance:/2)
[92 5]
```

Specify distance as literal block:

```
>>> [1.5 0.6; 2 0; 1.25 1.25; 3 0.3]
>>> .centralFeature { :u :v |
>>> 	[3 2].dot((u - v) ^ 2).sqrt
>>> }
[1.5 0.6]
```

Obtain a robust estimate of multivariate location when outliers are present:

```
>>> [3 -5; 2 -5; 0 2; -4 -3; 1E8 -1; 8 -20000]
>>> .centralFeature(euclideanDistance:/2)
[2 -5]
```

Extreme values have a large influence on the Mean:

```
>>> [3 -5; 2 -5; 0 2; -4 -3; 1E8 -1; 8 -20000]
>>> .mean
[(5 / 3) * 1E7, -10006/3]
```

* * *

See also: distanceMatrix, mean, median, trimmedMean, spatialMedian, winsorizedMean

Guides: Statistics Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CentralFeature.html)

Categories: Statistics
