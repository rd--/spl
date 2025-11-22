# withDo

- _withDo(c₁, c₂, f:/2)_

Evaluate the block _f_ with corresponding elements from the sequences _c₁_ and _c₂_,
which must have the same `size`.

```
>>> let x = [];
>>> 2:5.withDo(7:4:-1) { :i :j |
>>> 	x.add([i, j, i - j])
>>> };
>>> x
[2 7 -5; 3 6 -3; 4 5 -1; 5 4 1]
```

* * *

See also: do, reverseWithDo, withCollect, withIndexDo

Guides: Iteration Functions

References:
_Smalltalk_
5.7.8.28

Categories: Enumerating
