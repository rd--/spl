# newFrom

- _newFrom(f:/n, c)_

Implements the Smalltalk idiom to make a new collection from the species of an existing collection.

At `species` of `List`,
which is a unary block,
construct a new list given a `Range`:

```
>>> [].species.newFrom(1:9)
[1 2 3 4 5 6 7 8 9]

>>> [].species
List:/1

>>> List:/1.newFrom(1:9)
[1 2 3 4 5 6 7 8 9]
```

At `species` of `SortedSet`,
which is a no-argument block,
construct a new set given a `Range`:

```
>>> {| |}.species.newFrom(1:9)
{|1, 2, 3, 4, 5, 6, 7, 8, 9|}

>>> {| |}.species
SortedSet:/0

>>> SortedSet:/0.newFrom(1:9)
{|1, 2, 3, 4, 5, 6, 7, 8, 9|}
```

* * *

See also: fillFrom, new, species

Guides: Collection Functions

Categories: Instance Creation, Reflection
