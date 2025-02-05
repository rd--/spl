# foldBetweenAnd

- _foldBetweenAnd(aNumber, low, high)_

Fold an integer between two indices:

```
>>> 1:9.collect { :each |
>>> 	each.foldBetweenAnd(3, 7)
>>> }
[5 4 3 4 5 6 7 6 5]
```

Fold a floating point number between two values:

```
>>> (0.2, 0.3 .. 0.8).collect { :each |
>>> 	each.foldBetweenAnd(0.3, 0.7) * 10
>>> }.rounded
[4 3 4 5 6 7 6]
```

Plot a triangle wave formed by folding a line:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	(x * 4).foldBetweenAnd(-1, 1)
}
~~~

![](sw/spl/Help/Image/foldBetweenAnd-A.svg)

* * *

See also: atFold, atWrap, foldIndex, wrapBetweenAnd
