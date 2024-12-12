# keysAndValuesDo

- _keysAndValuesDo(aDictionary | aSequence, aBlock:/2)_

Apply _aBlock_ to each `key` and `value` of _aDictionary_.

At `Record`:

```
>>> let answer = [];
>>> (x: 1, y: 2, z: 3).keysAndValuesDo { :key :value |
>>> 	answer.addAll([key, value])
>>> };
>>> answer
['x' 1 'y' 2 'z' 3]
```

At `List`:

```
>>> let answer = [];
>>> ['x' 'y' 'z'].keysAndValuesDo { :key :value |
>>> 	answer.addAll([key, value])
>>> };
>>> answer
[1 'x' 2 'y' 3 'z']
```

Iterate over keys and values:

```
>>> let n = 0;
>>> (x: 1, y: 2, z: 3).keysAndValuesDo { :unusedKey :value |
>>> 	n := n + value
>>> };
>>> n
6
```

* * *

See also: associationsDo, do, fromTokeysAndValuesDo, keysAndValuesCollect, keysDo, valuesDo, withIndexDo

References:
_Smalltalk_
5.7.2.11

Categories: Enumerating
