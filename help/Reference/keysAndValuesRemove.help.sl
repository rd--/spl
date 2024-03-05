# keysAndValuesRemove

- _keysAndValuesRemove(aDictionary, keyValueBlock:/2)_

Removes all entries from _aDictionary_ for which _keyValueBlock_ answers true.

When removing many items, you must not do it while iterating over the dictionary, which may be changing.

This method takes care of tallying the removals in a first pass, and then performing all the deletions afterward.

```
>>> let d = (x: 1, y: 2, z: 3);
>>> d.keysAndValuesRemove { :key :value | key = 'y' | { value = 3 } };
>>> d
(x: 1)
```

* * *

See also: Dictionary, removeAllSuchThat, removeKey

Categories: Removing
