# ofSize

- _ofSize(aBlock:/1, anInteger)_
- _ofSize(aCollection, anInteger)_

Implements the Smalltalk idiom _aCollection.species.ofSize(anInteger)_.

In the first case, evaluate _aBlock(anInteger)_ to create a new collection of size _anInteger_,
with nil as every element.

```
>>> [].species.ofSize(3)
[nil nil nil]
```

In the second case ensure _aCollection_ has _anInteger_ places:

```
>>> [1 2 3].ofSize(3)
[1 2 3]
```

Any newly created places have nil as the element:

```
>>> [1 2 3].ofSize(5)
[1 2 3 nil nil]
```

If the collection has as many or more places than requested, it is answered unchanged:

```
>>> [1 2 3 4 5].ofSize(3)
[1 2 3 4 5]
```

This method exists because for some collection types the species block may create an empty collection.

* * *

See also: new, newFrom, species

Categories: Instance Creation, Reflection
