# keysAndValuesDo

- _keysAndValuesDo(d, f:/2)_

Apply the block _f_ to each `key` and `value` of the dictionary _d_.

Iterate over keys and values at `Map`:

```
>>> let n = 0;
>>> let c = [];
>>> ['x': 1, 'y': 2, 'z': 3]
>>> .keysAndValuesDo { :key :value |
>>> 	n := n + value;
>>> 	c.add([key n])
>>> };
>>> c
['x' 1; 'y' 3; 'z' 6]
```

At `Record`:

```
>>> let answer = [];
>>> (x: 1, y: 2, z: 3)
>>> .keysAndValuesDo { :key :value |
>>> 	answer.addAll([key, value])
>>> };
>>> answer
['x' 1 'y' 2 'z' 3]
```

At a `List` of associations:

```
>>> let answer = [];
>>> [1 -> 'x', 2 -> 'y', 3 -> 'z']
>>> .keysAndValuesDo { :key :value |
>>> 	answer.addAll([key, value])
>>> };
>>> answer
[1 'x' 2 'y' 3 'z']
```

* * *

See also: associationsDo, do, keysAndValuesCollect, keysDo, valuesDo, withIndexDo

Guides: Dictionary Functions, Iteration Functions

References:
_Smalltalk_
5.7.2.11

Categories: Enumerating
