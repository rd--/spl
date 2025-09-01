# wrapExclusive

- _wrapExclusive(x, ⌊, ⌈)_

Wrap _x_ so that it lies between ⌊ and ⌈.
Within the boundaries equivalent to `identity`,
note that the the upper bound is excluded:

```
>>> -2.wrapExclusive(-1, 1)
0
```

Threads elementwise over lists.

```
>>> [-2 -1 0 1 2].wrapExclusive(-1, 1)
[0 -1 0 -1 0]
```

Wrap between two integer indices,
note that the wrap occurs _before_ the upper boundary is reached:

```
>>> 1:9.wrapExclusive(3, 7 + 1)
[6 7 3 4 5 6 7 3 4]

>>> 0:12.wrapExclusive(0, 3)
[0 1 2 0 1 2 0 1 2 0 1 2 0]
```

Wrap a real number between two values:

```
>>> let r = (0.1, 0.2 .. 0.9);
>>> let w = r.wrapExclusive(
>>> 	0.3,
>>> 	0.7 + 0.1
>>> );
>>> (w * 10).round
[6 7 3 4 5 6 7 3 4]
```

Plot a sawtooth wave formed by wrapping a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).wrapExclusive(-1, 1)
}
~~~

![](sw/spl/Help/Image/wrapExclusive-A.svg)

* * *

See also: atFold, atWrap, fold, foldIndex, wrap, wrapIndex

Guides: Indexing Functions

Categories: Testing
