# keysDo

- _keysDo(aDictionary, aBlock:/1)_

Evaluate _aBlock_ with each key of _aDictionary_ as the argument.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).keysDo { :each | list.add(each) };
>>> list
['x' 'y' 'z']
```

* * *

See also: associationsDo, do, keysAndValuesDo, valuesDo

Categories: Enumerating
