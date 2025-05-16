# asTuple

- _asTuple(anObject)_

Composite types may provide an `asTuple` method to answer a `Tuple` form of the value.

At `List`:

```
>>> [1 3 5].asTuple
(1, 3, 5)
```

Unlike the `Tuple` constructor,
`asTuple` answers a `Tuple` holding a `copy` of the list.

```
>>> let a = [1 2 3];
>>> let b = Tuple(a);
>>> let c = asTuple(a);
>>> a[2] := -2;
>>> (a, b, c)
([1 -2 3], (1, -2, 3), (1, 2, 3))
```

* * *

See also: asList

Categories: Converting
