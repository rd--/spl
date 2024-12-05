# withIndexCollect

- _withIndexCollect(aSequence, aBlock:/2)_

Like `withCollect` except that the iteration index supplies the second argument to the block.

At `Range`:

```
>>> 9:1.withIndexCollect { :each :index |
>>> 	each * 2 + index
>>> }
[19 .. 11]

>>> 9:1.withCollect(1:9) { :each :index |
>>> 	each * 2 + index
>>> }
[19 .. 11]
```

* * *

See also: collect, keysAndValuesCollect, withCollect, withIndexDo, withIndexReplace

References:
_Julia_
[1](https://docs.julialang.org/en/v1/base/iterators/#Base.Iterators.enumerate)

Categories: Enumerating
