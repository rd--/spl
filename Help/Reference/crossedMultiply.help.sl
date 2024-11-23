# crossedMultiply

- _crossedMultiply(aSequence, anotherSequence)_

Calculate the flattened _outer product_ (⊗) of two vectors.

```
>>> [3, 5].crossedMultiply([7, 9])
[21 27 35 45]

>>> [10 20 30 40 50].crossedMultiply([1 2 3])
[10 20 30 20 40 60 30 60 90 40 80 120 50 100 150]

>>> [10 20 30 40 50] *.x [1 2 3]
[10 20 30 20 40 60 30 60 90 40 80 120 50 100 150]

>>> [10 20 30 40 50].crossedMultiply([1 2 3])
[10 20 30 40 50].withCollectCrossed([1 2 3], *)
```

* * *

See also: *, cross, dot, withCollectCrossed

Unicode: ⊗ U+2297 Circled Times

Categories: Arithmetic
