# withCollect

- _withCollect(aSequence, anotherSequence, aBlock:/2)_

Collect and answer the result of evaluating _aBlock_ with corresponding elements from _aSequence_ and _anotherSequence_.

```
>>> 9:1.withCollect(1:9) { :p :q | p * 2 + q }
[19 .. 11]
```

* * *

See also: collect, map, withIndexCollect

References:
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:zipWith),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MapThread.html)

Categories: Enumerating
