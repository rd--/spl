# withIndexCollect

- _withIndexCollect(c, f:/2)_

Answer a collection like the collection _c_ where the values are given by _f_,
which receives both the _value_ and _index_ for each element.

At `List`:

```
>>> [3 4 2 5 1]
>>> .withIndexCollect { :x :i |
>>> 	i -> x
>>> }
[1 -> 3, 2 -> 4, 3 -> 2, 4 -> 5, 5 -> 1]
```

At `Record`, see also `keysAndValuesCollect`:

```
>>> (x: 1, y: 3, z: 5)
>>> .withIndexCollect { :x :i |
>>> 	(x * 2) -> i
>>> }
(x: 2 -> 'x', y: 6 -> 'y', z: 10 -> 'z')
```

At `Range`:

```
>>> (9, 8 .. 1).withIndexCollect { :x :i |
>>> 	x * 2 + i
>>> }
[19, 18 .. 11]
```

For sequences this is like `withCollect`,
except that the iteration index supplies the second argument to the block.
An equivalent expression using `withCollect`:

```
>>> (9, 8 .. 1).withCollect(1:9) { :x :i |
>>> 	x * 2 + i
>>> }
[19, 18 .. 11]
```

Take odd digits of _n_ with negative sign,
OEIS [A121758](https://oeis.org/A121758):

~~~spl svg=A
1:69.collect { :n |
	n.integerDigits
	.reverse
	.withIndexCollect { :x :i |
		(-1 ^ x) * x * (10 ^ (i - 1))
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/withIndexCollect-A.svg)

Take even digits of _n_ with negative sign,
OEIS [A121759](https://oeis.org/A121759):

~~~spl svg=B
1:69.collect { :n |
	n.integerDigits
	.reverse
	.withIndexCollect { :x :i |
		(-1 ^ (x + 1)) * x * (10 ^ (i - 1))
	}.sum
}.discretePlot
~~~

![](sw/spl/Help/Image/withIndexCollect-B.svg)

* * *

See also: collect, keysAndValuesCollect, withCollect, withIndexDo, withIndexReplace

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.enumerate),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapIndexed.html)

Categories: Enumerating
