# capacity

- _capacity(c)_

Answer the current capacity of the collection _c_.

At `List` is equal to size:

```
>>> [1 3 5 7 9].capacity
5
```

At `BitSet`:

```
>>> let b = BitSet([1 3 5 7 9], 10);
>>> (b.capacity, b.size)
(10, 5)
```

* * *

See also: Collection, size

Categories: Accessing
