# faurePermutation

- _faurePermutation(n)_

Implement an algorithm by Faure for generating a permuation of the integers _0:n-1_.

The first few permutations:

```
>>> 1:16.collect(faurePermutation:/1)
[
	0;
	0 1;
	0 1 2;
	0 2 1 3;
	0 3 2 1 4;
	0 2 4 1 3 5;
	0 2 5 3 1 4 6;
	0 4 2 6 1 5 3 7;
	0 5 2 7 4 1 6 3 8;
	0 6 4 2 8 1 7 5 3 9;
	0 7 4 2 9 5 1 8 6 3 10;
	0 4 8 2 6 10 1 5 9 3 7 11;
	0 4 9 2 7 11 6 1 5 10 3 8 12;
	0 4 10 6 2 8 12 1 5 11 7 3 9 13;
	0 4 11 6 2 9 13 7 1 5 12 8 3 10 14;
	0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15
]
```

The seventeen place permutation:

```
>>> 17.faurePermutation
[
	0  9  4 13  2 11  6 15
	8
	1 10  5 14  3 12  7 16
]
```

The twenty-three place permutation:

```
>>> 23.faurePermutation
[
	 0 15  8  4 19 10  2 17 13  6 21
	11
	 1 16  9  5 20 12  3 18 14  7 22
]
```

Step plot of the thirty-two place permutation:

~~~spl svg=A
32.faurePermutation.stepPlot
~~~

![](sw/spl/Help/Image/faurePermutation-A.svg)

Scatter plot of the two-hundred and fifty-six place permutation:

~~~spl svg=B
256.faurePermutation.scatterPlot
~~~

![](sw/spl/Help/Image/faurePermutation-B.svg)

* * *

See also: haltonSequence, hammersleyPointSet, sobolSequence, vanDerCorputNumber

Guides: Integer Sequence Functions, Low-Discrepancy Sequence Functions, Permutation Functions, Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/QuasirandomSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/Low-discrepancy_sequences)
[2](https://en.wikipedia.org/wiki/Quasi-Monte_Carlo_method)
