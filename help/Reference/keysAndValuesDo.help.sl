# keysAndValuesDo

- _keysAndValuesDo(aDictionary, aBlock:/2)_

Apply _aBlock_ to each `key` and `value` of _aDictionary_.

```
>>> let list = [];
>>> (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value |
>>> 	list.addAll([key, value])
>>> };
>>> list
['x' 1 'y' 2 'z' 3]
```

Iterate over keys and values:

```
>>> let n = 0;
>>> (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value |
>>> 	n := n + value
>>> };
>>> n
6
```

* * *

See also: associationsDo, do, keysDo, valuesDo, withIndexDo

References:
_Smalltalk_
5.7.2.11

Categories: Enumerating
