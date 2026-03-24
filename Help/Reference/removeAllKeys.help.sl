# removeAllKeys

- _removeAllKeys(d, c)_

Remove any elements from the dictionary _d_ which are stored at the keys specified in the collection _c_.
This message has the same effect on _d_ as repeatedly sending the `removeKey` message for each element in _c_.
The answer is the keys of the items removed.

```
>>> let d = (x: 1, y: 2, z: 3);
>>> (d.removeAllKeys(['x' 'z']), d)
(['x' 'z'], (y: 2))
```

The answer does not contain keys from _c_ that do not exist at _d_:

```
>>> let d = (x: 1, y: 2, z: 3);
>>> (d.removeAllKeys(['w' 'x' 'z']), d)
(['x' 'z'], (y: 2))
```

* * *

See also: removeKey

References:
_Smalltalk_
5.7.2.11

Categories: Removing
