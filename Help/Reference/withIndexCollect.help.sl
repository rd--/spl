# withIndexCollect

- _withIndexCollect(c, f:/2)_

Answer a collection like the collection _c_ where the values are given by _f_,
which receives both the _value_ and _index_ for each element.

At `List`:

```
>>> [3 4 2 5 1]
>>> .withIndexCollect { :each :index |
>>> 	index -> each
>>> }
[1 -> 3, 2 -> 4, 3 -> 2, 4 -> 5, 5 -> 1]
```

At `Record`, see also `keysAndValuesCollect`:

```
>>> (x: 1, y: 3, z: 5)
>>> .withIndexCollect { :each :index |
>>> 	(each * 2) -> index
>>> }
(x: 2 -> 'x', y: 6 -> 'y', z: 10 -> 'z')
```

At `Range`:

```
>>> (9, 8 .. 1).withIndexCollect { :each :index |
>>> 	each * 2 + index
>>> }
[19, 18 .. 11]
```

For sequences this is like `withCollect`,
except that the iteration index supplies the second argument to the block.
An equivalent expression using `withCollect`:

```
>>> (9, 8 .. 1).withCollect(1:9) { :each :index |
>>> 	each * 2 + index
>>> }
[19, 18 .. 11]
```

* * *

See also: collect, keysAndValuesCollect, withCollect, withIndexDo, withIndexReplace

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.enumerate),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapIndexed.html)

Categories: Enumerating
