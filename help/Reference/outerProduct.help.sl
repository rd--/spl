# outerProduct

- _outerProduct(aSequence, anotherSequence)_

Answer the outer product of two sequences.

```
>>> [1 2 3].outerProduct([4 5])
[4 5; 8 10; 12 15]

>>> [1 2].outerProduct([3 4 5])
[3 4 5; 6 8 10]
```

`outerProduct` of two four vectors:

```
>>> let a = [1 1 0 0];
>>> let b = [1 2 3 4];
>>> b.outerProduct(a)
[
	1 1 0 0;
	2 2 0 0;
	3 3 0 0;
	4 4 0 0
]
```

`outerProduct` is `outer` of `*`:

```
>>> [1 2 3] *.outer [4 5]
[4 5; 8 10; 12 15]

>>> [1 2] *.outer [3 4 5]
[3 4 5; 6 8 10]
```

A multiplication table:

```
>>> let x = [1 .. 5];
>>> x.outerProduct(x)
[1 2 3 4 5; 2 4 6 8 10; 3 6 9 12 15; 4 8 12 16 20; 5 10 15 20 25]
```

* * *

See also: dot, inner, outer
