# keysAndValuesRemove

- _keysAndValuesRemove(d, f:/2)_

Removes all entries from the dictionary _d_ for which key and value block _f_ answers `true`.

When removing many items, you must not do it while iterating over the dictionary, which may be changing.

This method takes care of tallying the removals in a first pass, and then performing all the deletions afterward.

```
>>> let d = (x: 1, y: 2, z: 3);
>>> d.keysAndValuesRemove { :key :value |
>>> 	key = 'y' | { value = 3 }
>>> };
>>> d
(x: 1)
```

* * *

See also: Dictionary, removeAllSuchThat, removeKey

Guides: Dictionary Functions

Categories: Removing
