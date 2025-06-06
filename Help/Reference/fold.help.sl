# fold

- _fold(x, ⌊, ⌈)_

Fold _x_ to lie between ⌊ and ⌈.

Threads over lists,
equivalent to `identity` at and between the boundaries:

```
>>> [-1 0 1].fold(-1, 1)
[-1 0 1]
```

Fold an integer between two indices:

```
>>> 1:9.fold(3, 7)
[5 4 3 4 5 6 7 6 5]
```

Fold a floating point number between two values:

```
>>> let x = (0.2, 0.3 .. 0.8);
>>> let y = x.fold(0.3, 0.7);
>>> (y * 10).rounded
[4 3 4 5 6 7 6]
```

Plot a triangle wave formed by folding a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).fold(-1, 1)
}
~~~

![](sw/spl/Help/Image/fold-A.svg)

* * *

See also: atFold, atWrap, foldIndex, wrapExclusive

References:
_Max_
[1](https://docs.cycling74.com/reference/gen_common_fold/)
