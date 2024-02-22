# keysAndValuesDo

- _keysAndValuesDo(aDictionary, aBlock:/2)_

Apply _aBlock_ to each `key` and `value` of _aDictionary_.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value | list.addAll([key, value]) };
>>> list
['x' 1 'y' 2 'z' 3]
```

* * *

See also: associationsDo, do, keysDo, valuesDo, withIndexDo

Categories: Enumerating
