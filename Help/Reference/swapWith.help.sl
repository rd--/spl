# swapWith

- _swapWith([x₁ x₂ …], i, j)_

Move the element at index _i_ of the sequence _x_ to index _j_, and vice-versa.

At `List`, swap elements at indices one and four:

```
>>> let l = [1 .. 5];
>>> l.swapWith(1, 4);
>>> l
[4 2 3 1 5]
```

At a matrix, swaps rows:

```
>>> let l = [4 4].iota;
>>> l.swapWith(1, 4);
>>> l
[
	13 14 15 16;
	 5  6  7  8;
	 9 10 11 12;
	 1  2  3  4
]
```

* * *

See also: at, atPut, swapAllWith, swapsColumns, swapsRows

Categories: Accessing
