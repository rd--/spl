# matchPairs

- _matchPairs(aMatrix)_

Solve the linear assignment problem for the rows and columns of _aMatrix_.
Each row is assigned to a column in such a way that the total cost is minimized.
The answer is a list of _(i, j)_ indices,
sorted by column index.

```
>>> [
>>> 	8 4 7;
>>> 	5 2 3;
>>> 	9 4 8
>>> ].matchPairs
[1 1; 3 2; 2 3]

>>> [
>>> 	600 670 960 560;
>>> 	900 280 970 540;
>>> 	310 350 950 820;
>>> 	325 290 600 540
>>> ].matchPairs
[3 1; 2 2; 4 3; 1 4]

>>> [310 280 600 560].sum
1750

>>> [
>>> 	4 1 3;
>>> 	2 0 5;
>>> 	3 2 2
>>> ].matchPairs
[2 1; 1 2; 3 3]

>>> [2 1 2].sum
5

>>> [
>>> 	82 83 69 92;
>>> 	77 37 49 92;
>>> 	11 69 5 86;
>>> 	8 9 98 23
>>> ].matchPairs
[3 1; 2 2; 1 3; 4 4]

>>> [11 37 69 23].sum
140

>>> [
>>> 	7 2 1 9 4 4;
>>> 	9 6 9 5 5 2;
>>> 	3 8 3 1 8 9;
>>> 	7 9 4 2 2 3;
>>> 	8 4 7 4 8 2;
>>> 	4 2 9 3 1 9
>>> ].matchPairs
[3 1; 5 2; 1 3; 4 4; 6 5; 2 6]

>>> [3 4 1 2 1 2].sum
13
```

At a non-square _m×n_ matrix only _m_ columns are matched:

```
>>> [
>>> 	84 93 35 97 97 22 82 13;
>>> 	92 67 59 24 54 48 97 87;
>>> 	21 18 97 98 82 93 69 94
>>> ].matchPairs
[3 2; 2 4; 1 8]

>>> [18 24 13].sum
55
```

* * *

See also: kuhnMunkresAlgorithm

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/matchpairs.html)
