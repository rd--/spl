# count

- _count(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Answer the number of elements that answered `true`.

```
>>> 1:9.count(isEven:/1)
4

>>> [1 .. 9].count(isEven:/1)
4

>>> (x: 1, y: 2, z: 3).count(isEven:/1)
1
```

* * *

See also: select

Categories: Enumerating
