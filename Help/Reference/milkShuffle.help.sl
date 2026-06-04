# milkShuffle

- _milkShuffle([x₁ x₂ …])_

Answer the _milk_ shuffle of the sequence _x_,
also called a klondike shuffle.

Milk shuffle of seven cards:

```
>>> 1:7.milkShuffle
[4 3 5 2 6 1 7]

>>> 1:7.milkShuffle
>>> .permutationCycles(false)
[1 4 2 3 5 6; 7]
```

Milk shuffle of eight cards:

```
>>> 1:8.milkShuffle
[4 5 3 6 2 7 1 8]

>>> 1:8.milkShuffle
>>> .permutationCycles(false)
[1 4 6 7; 2 5; 3; 8]
```

Milk shuffle of twelve cards:

```
>>> 1:12.milkShuffle
[6 7 5 8 4 9 3 10 2 11 1 12]

>>> 1:12.milkShuffle
>>> .permutationCycles(false)
[1 6 9 2 7 3 5 4 8 10 11; 12]
```

Four milk shuffles of eight cards:

```
>>> milkShuffle:/1.nestList([1 .. 8], 4)
[
	1 2 3 4 5 6 7 8;
	4 5 3 6 2 7 1 8;
	6 2 3 7 5 1 4 8;
	7 5 3 1 2 4 6 8;
	1 2 3 4 5 6 7 8
]
```

Shuffles of cards counted from zero:

```
>>> 0:4.milkShuffle
[2 1 3 0 4]

>>> 0:5.milkShuffle
[2 3 1 4 0 5]

>>> 0:6.milkShuffle
[3 2 4 1 5 0 6]

>>> 0:7.milkShuffle
[3 4 2 5 1 6 0 7]
```

Visualize the recurring pattern when shuffling an eleven place list:

~~~spl svg=A
milkShuffle:/1.nestList(
	[1 .. 11], 6
).matrixPlot
~~~

![](Help/Image/milkShuffle-A.svg)

Visualize the recurring pattern when shuffling a fourty-three place list:

~~~spl svg=B
milkShuffle:/1.nestList(
	[1 .. 43], 8
).matrixPlot
~~~

![](Help/Image/milkShuffle-B.svg)

Calculate the order of the _n_-place milk shuffle:

```
>>> let n = 43;
>>> let m = 2 * (n - 1) + 1;
>>> 2.multiplicativeSuborder(m)
8
```

* * *

See also: inShuffle, klondikeShuffle, mongesShuffle, outShuffle

Guides: Permutation Functions
