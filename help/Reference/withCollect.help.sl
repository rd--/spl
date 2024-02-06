# withCollect

- _withCollect(aSequence, anotherSequence, aBlock:/2)_

Collect and answer the result of evaluating _aBlock_ with corresponding elements from _aSequence_ and _anotherSequence_.

```
>>> 9:1.withCollect(1:9) { :p :q | p * 2 + q }
[19 .. 11]
```

* * *

See also: collect, map, withIndexCollect

Categories: Enumerating
