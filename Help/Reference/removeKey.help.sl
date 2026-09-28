# removeKey

- _removeKey(d, k)_

Remove the element which is stored at key _k_ in the dictionary _d_.
Answer the removed element.

At `Record`

```
>>> let d = (x: 1, y: 2, z: 3);
>>> (d.removeKey('y'), d)
(2, (x: 1, z: 3))
```

At `Dictionary`

```
>>> let d = Dictionary['x' -> 1, 2L -> 'y'];
>>> (d.removeKey('x'), d.at(2))
(1, 'y')
```

If the key does not exist it is an `error`:

```
>>> {
>>> 	(x: 1, y: 2).removeKey('w')
>>> }.hasError
true
```

* * *

See also: remove, removeAllKeys, removeAt, removeKeyIfAbsent

References:
_Smalltalk_
5.7.2.16

Categories: Removing
