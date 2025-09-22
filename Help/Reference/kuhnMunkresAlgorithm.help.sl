# kuhnMunkresAlgorithm

- _kuhnMunkresAlgorithm(m)_

The Kuhn–Munkres algorithm,
also called the Hungarian method,
is a combinatorial optimization algorithm that solves the assignment problem in polynomial time.

The input _m_ is ordinarily a square cost matrix,
although matrices with fewer rows than columns are allowed.
The answer is a list of _[minimaPerRow, rowIndices]_,
where the last minima is the minimum cost and the row indices are in column sequence,
a `zero` indicating unassigned columns.

```
>>> [
>>> 	8 4 7;
>>> 	5 2 3;
>>> 	9 4 8
>>> ].kuhnMunkresAlgorithm
[4 7 15; 1 3 2]

>>> [8 4 3].sum
15

>>> [
>>> 	2 5 9;
>>> 	2 1 5;
>>> 	5 2 2
>>> ].kuhnMunkresAlgorithm
[2 3 5; 1 2 3]

>>> [2 1 2].sum
5

>>> [
>>> 	40 15 40;
>>> 	40 45 60;
>>> 	30 22 30
>>> ].kuhnMunkresAlgorithm
[15 55 85; 2 1 3]

>>> [40 15 30].sum
85

>>> [
>>> 	4 5 2;
>>> 	9 1 7;
>>> 	8 5 2
>>> ].kuhnMunkresAlgorithm
[2 3 7; 1 2 3]

>>> [4 1 2].sum
7

>>> [
>>> 	5 9 1;
>>> 	10 3 2;
>>> 	8 7 4
>>> ].kuhnMunkresAlgorithm
[1 4 12; 3 2 1]

>>> [8 3 1].sum
12

>>> [1 1; 1 1]
>>> .kuhnMunkresAlgorithm
[1 2; 1 2]

>>> [1 1].sum
2

>>> [1 1 1; 1 1 1]
>>> .kuhnMunkresAlgorithm
[1 2; 1 2 0]

>>> [1 1].sum
2

>>> [
>>> 	1 2 3;
>>> 	6 5 4;
>>> 	1 1 1
>>> ].kuhnMunkresAlgorithm
[1 5 6; 1 3 2]

>>> [1 1 4].sum
6

>>> [
>>> 	10 25 15 20;
>>> 	15 30  5 15;
>>> 	35 20 12 24;
>>> 	17 25 24 20
>>> ].kuhnMunkresAlgorithm
[10 15 35 55; 1 3 2 4]

>>> [10 20 5 20].sum
55

>>> [
>>> 	5 3 -1;
>>> 	2 4 -6;
>>> 	9 9 -9
>>> ].kuhnMunkresAlgorithm
[-1 -3 -4; 2 1 3]

>>> [2 3 -9].sum
-4

>>> [
>>> 	82 83 69 92;
>>> 	77 37 49 92;
>>> 	11 69 5 86;
>>> 	8 9 98 23
>>> ].kuhnMunkresAlgorithm
[69 106 117 140; 3 2 1 4]

>>> [11 37 69 23].sum
140

>>> [
>>> 	4 1 3;
>>> 	2 0 5;
>>> 	3 2 2
>>> ].kuhnMunkresAlgorithm
[1 3 5; 2 1 3]

>>> [2 1 2].sum
5

>>> [
>>> 	1 2 3;
>>> 	6 5 4
>>> ].kuhnMunkresAlgorithm
[1 5; 1 0 2]

>>> [1 0 4].sum
5

>>> [
>>> 	1 2 3 4;
>>> 	2 4 6 8;
>>> 	3 6 9 12;
>>> 	4 8 12 16
>>> ].kuhnMunkresAlgorithm
[1 4 10 20; 4 3 2 1]

>>> [4 6 6 4].sum
20

>>> [
>>> 	1 2 3;
>>> 	2 4 6;
>>> 	3 6 9
>>> ].kuhnMunkresAlgorithm
[1 4 10; 3 2 1]

>>> [3 4 3].sum
10

>>> [
>>> 	40 15 40 1;
>>> 	40 45 60 2;
>>> 	30 22 30 3;
>>> 	0  0  0  0
>>> ].kuhnMunkresAlgorithm
[1 17 47 47; 3 1 4 2]

>>> [30 15 2 0].sum
47

>>> [
>>> 	9 5 5 6 5;
>>> 	1 9 4 7 3;
>>> 	1 2 7 4 9;
>>> 	8 1 4 4 4;
>>> 	1 6 4 9 4
>>> ].kuhnMunkresAlgorithm
[5 6 8 10 14; 5 4 1 3 2]

>>> [5 3 4 1 1].sum
14

>>> [
>>> 	7 6 2 9 2;
>>> 	6 2 1 3 9;
>>> 	5 6 8 9 5;
>>> 	6 8 5 8 6;
>>> 	9 5 6 4 7
>>> ].kuhnMunkresAlgorithm
[2 3 8 14 18; 3 2 4 5 1]

>>> [2 2 5 5 4].sum
18

>>> [
>>> 	7 2 1 9 4 4;
>>> 	9 6 9 5 5 2;
>>> 	3 8 3 1 8 9;
>>> 	7 9 4 2 2 3;
>>> 	8 4 7 4 8 2;
>>> 	4 2 9 3 1 9
>>> ].kuhnMunkresAlgorithm
[1 3 4 6 10 13; 3 5 1 4 6 2]

>>> [3 4 1 2 1 2].sum
13

>>> [
>>> 	250 400 350;
>>> 	400 600 350;
>>> 	200 400 250
>>> ].kuhnMunkresAlgorithm
[250 600 950; 3 1 2]

>>> [400 350 200].sum
950

>>> [
>>> 	90 75 75 80;
>>> 	35 85 55 65;
>>> 	125 95 90 105;
>>> 	45 110 95 115
>>> ].kuhnMunkresAlgorithm
[75 110 200 275; 4 1 3 2]

>>> [45 75 90 65].sum
275

>>> [
>>> 	8 4 7 0;
>>> 	5 2 3 0;
>>> 	9 6 7 0;
>>> 	9 4 8 0
>>> ].kuhnMunkresAlgorithm
[-0 2 7 15; 1 4 2 3]

>>> [8 4 3 0].sum
15

>>> [
>>> 	600 670 960 560;
>>> 	900 280 970 540;
>>> 	310 350 950 820;
>>> 	325 290 600 540
>>> ].kuhnMunkresAlgorithm
[560 840 1150 1750; 3 2 4 1]

>>> [310 280 600 560].sum
1750

>>> [
>>> 	84 93 35 97 97 22 82 13;
>>> 	92 67 59 24 54 48 97 87;
>>> 	21 18 97 98 82 93 69 94
>>> ].kuhnMunkresAlgorithm
[13 37 55; 0 3 0 2 0 0 0 1]

>>> [0 18 0 24 0 0 0 13].sum
55

>>> let p = [
>>> 	5.7 6.3 3.1 4.8 3.5;
>>> 	5.8 6.4 3.3 4.7 3.2;
>>> 	5.7 6.3 3.2 4.9 3.4
>>> ];
>>> let c = p.deepMax - p;
>>> c.kuhnMunkresAlgorithm
[0.1 0.7 2.2; 1 2 0 3 0]

>>> [5.7 6.4 0 4.9 0].sum
17
```

* * *

See also: matchPairs

Guides: Matrix Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HungarianMaximumMatchingAlgorithm.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/matchpairs.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.linear_sum_assignment.html),
_W_
[1](https://en.wikipedia.org/wiki/Assignment_problem)
[2](https://en.wikipedia.org/wiki/Hungarian_algorithm)
