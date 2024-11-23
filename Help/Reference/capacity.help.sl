# capacity

- _capacity(aCollection)_

Answer the current capacity of _aCollection_.

At `List` is equal to size:

```
>>> [1 3 5 7 9].capacity
5
```

At `BitSet`:

```
>>> let b = [1 3 5 7 9].asBitSet;
>>> (b.capacity, b.size)
(10, 5)
```

* * *

See also: Collection, size

Categories: Accessing
