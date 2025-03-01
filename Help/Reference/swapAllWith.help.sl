# swapAllWith

- _swapAllWith(aSequence, indices)_

Swap each _(i, j)_ index pair in _indices_.
If the indices are integers, each swap is as if by `swapWith`.
If the indices are lists, each swap is as if by `swapPathWith`.

At `List`:

```
>>> let l = [1 .. 9];
>>> l.swapAllWith([1 7; 3 4]);
>>> l
[7 2 4 3 5 6 1 8 9]
```

`swapAllWith` is an in place form of a subset of `permute`:

```
>>> [1 .. 9].permute([1 7; 3 4])
[7 2 4 3 5 6 1 8 9]
```

At a matrix, swaps rows:

```
>>> let l = [5 5].iota;
>>> l.swapAllWith([1 2; 3 5]);
>>> l
[
	 6  7  8  9 10;
	 1  2  3  4  5;
	21 22 23 24 25;
	16 17 18 19 20;
	11 12 13 14 15
]
```

Path swaps:

```
>>> let l = [3 3].iota;
>>> l.swapAllWith([1 1; 3 3:; 1 3; 3 1]);
>>> l
[
	9 2 7;
	4 5 6;
	3 8 1
]
```

* * *

See also: at, atPut, permute, swapPathWith, swapWith

Categories: Accessing
