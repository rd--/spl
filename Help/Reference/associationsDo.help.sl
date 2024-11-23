# associationsDo

- _associationsDo(aDictionary, aBlock:/1)_

Evaluate _aBlock_ with each `Association` of _aDictionary_ as the argument.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).associationsDo { :each | list.add(each) };
>>> list
['x' -> 1, 'y' -> 2, 'z' -> 3]
```

* * *

See also: associations, do, keysDo, keysAndValuesDo, valuesDo

Categories: Enumerating
