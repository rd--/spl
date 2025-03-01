# swapPathWith

- _swapWith(aCollection, i, j)_

Move the element at path index _i_ of _aCollection_ to path index _j_, and vice-versa.

At a matrix:

```
>>> let l = [3 3].iota;
>>> l.swapPathWith([1 2], [3 2]);
>>> l
[
	1 8 3;
	4 5 6;
	7 2 9
]
```

* * *

See also: at, atPut, swapAllWith, swapWith

Categories: Accessing
