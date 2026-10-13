# new

- _new(c, n=0)_

Create a new collection that is like the collection _c_ that has _n_ places.
`new` is defined in terms of `species`.
`new` is the mechanism by which functions such as `collect` answer the appropriate type.
The names `new` and `species` are from Smalltalk.

The unary form, for collections where `species` answers a no-argument block:

```
>>> IdentitySet().species
IdentitySet/0

>>> IdentitySet().new
IdentitySet()
```

The binary form, for collections where `species` answers a one-argument block:

```
>>> [].species
List/1

>>> [].new(3)
[nil nil nil]
```

Note that the binary form of `new` does not necessarily answer a collection of size _n_,
see also `newOfSize`:

```
>>> let a = LinkedList[1 2 3];
>>> let b = a.new(3);
>>> (a.size, b.size)
(3, 0)
```

* * *

See also: New, newFrom, newOfSize, species

Guides: Collection Functions

References:
_Smalltalk_
5.3.9.1

Categories: Instance Creation, Reflection
