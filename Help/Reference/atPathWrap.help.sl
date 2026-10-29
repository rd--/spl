# atPathWrap

- _atPathWrap(c, [i₁ i₂ …])_

A variant on `atPath` where each lookup in _c_ is made using `atWrap`.

Cyclic expansion of a vector:

```
>>> let a = [1 2 3];
>>> { :i | a.atPathWrap(i) }.fill([5])
[1 2 3 1 2]
```

Cyclic expansion of a matrix:

```
>>> let a = [1; 2 3; 4 5 6; 7 8; 9];
>>> { :i | a.atPathWrap(i) }.fill([5 3])
[
	1 1 1;
	2 3 2;
	4 5 6;
	7 8 7;
	9 9 9
]
```

Cyclic expansion of a volume:

```
>>> let a = [1; 2 3:; 4 5; 6];
>>> { :i | a.atPathWrap(i) }.fill([2 3 3])
[
	1 1 1;
	2 3 2;
	1 1 1
	:;
	4 5 4;
	6 6 6;
	4 5 4
]
```

* * *

See also: atPath, atWrap, fill

Guides: Array Functions
