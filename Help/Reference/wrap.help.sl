# wrap

- _wrap(x, ⌊, ⌈)_

Wrap _x_ so that it lies, inclusively, between ⌊ and ⌈.

```
>>> 2.wrap(-1, 1)
0
```

Threads elementwise over lists:

```
>>> [-2 -1 0 1 2].wrap(-1, 1)
[0 -1 0 1 0]
```

Within the boundaries equivalent to `identity`:

```
>>> [-1 0 1].wrap(-1, 1)
[-1 0 1]
```

Wrap between two integer indices,
note that both boundaries are included in the answer:

```
>>> 1:9.wrap(3, 7)
[5 6 3 4 5 6 7 4 5]

>>> 0:12.wrap(0, 3)
[0 1 2 3 1 2 3 1 2 3 1 2 3]
```

Wrap a real number between two values:

```
>>> [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]
>>> .wrap(0.3, 0.7)
[0.5 0.6 0.3 0.4 0.5 0.6 0.7 0.4 0.5]
```

Plot a sawtooth wave formed by wrapping a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).wrap(-1, 1)
}
~~~

![](sw/spl/Help/Image/wrap-A.svg)

* * *

See also: atFold, atWrap, fold, foldIndex, wrapExclusive, wrapIndex

Guides: Indexing Functions

Categories: Testing
