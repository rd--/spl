# associationsDo

- _associationsDo(d, f:/1)_

Evaluate the block _f_ with each `Association` of the dictionary _d_ as the argument.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).associationsDo { :each |
>>> 	list.add(each)
>>> };
>>> list
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

* * *

See also: associations, do, keysDo, keysAndValuesDo, valuesDo

Guides: Iteration Functions

Categories: Enumerating
