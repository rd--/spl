# Tuple

- _Tuple([x₁ x₂ …])_

A `Type` holding an _n_-tuple.
An _n_-tuple is an ordered heterogeneous set of _n_ elements.

```
>>> Tuple([1 2 3])
(1, 2, 3)
```

There is a syntax for writing tuples, `Tuple Syntax`:

```
>>> (1, 2, 3).isTuple
true
```

Tuple does not implement `Indexable`:

```
>>> (1, 2, 3).isIndexable
false
```

Tuple does not implement `Iterable`:

```
>>> (1, 2, 3).isIterable
false
```

Tuple does not implement `Collection`:

```
>>> (1, 2, 3).isCollection
false
```

Tuple does not implement `Sequenceable`:

```
>>> (1, 2, 3).isSequenceable
false
```

Tuple implements `at` and `size`,
allowing tuple values to be indexed using `At Syntax`:

```
>>> (1, 2, 3).at(1)
1

>>> (1, 2, 3).size
3

>>> let x = (1, 2, 3);
>>> x[1]
1
```

Tuple does not implement `atPut`,
they are not directly mutable:

```
>>> (1, 2, 3).respondsTo(atPut:/3)
false

>>> let x = (1, 2, 3);
>>> { x[1] := -1 }.hasError
true
```

* * *

See also: asTuple, List

Guides: List Syntax, Tuple Syntax

Categories: Collection, Type
