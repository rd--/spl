# keysAndEachValue

- _keysAndEachValue(d)_

Answer a two column table of the keys and items of each value at the `Dictionary` _d_.
Each value in the dictionary must be a collection,
add an entry is added to the table for each item in the collection.

At `Record`:

```
>>> (x: [1 2 3], y: [4 5], z: [6])
>>> .keysAndEachValue
['x' 1; 'x' 2; 'x' 3; 'y' 4; 'y' 5; 'z' 6]
```

* * *

See also: associations, Dictionary, indices, keys, keysAndValues, values

Guides: Dictionary Functions

Categories: Accessing
