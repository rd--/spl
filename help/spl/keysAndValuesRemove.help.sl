# keysAndValuesRemove -- removing

- _keysAndValuesRemove(aDictionary, keyValueBlock:/2)_

Removes all entries from _aDictionary_ for which _keyValueBlock_ returns true.

When removing many items, you must not do it while iterating over the dictionary, which may be changing.

This method takes care of tallying the removals in a first pass, and then performing all the deletions afterward.

* * *

See also: Dictionary, removeAllSuchThat, removeKey
