# removeAllKeys

- _removeAllKeys(aDictionary, aCollection)_

Remove any elements from _aDictionary_ which are stored at the keys specified in _aCollection_.
This message has the same effect on the receiver as repeatedly sending the `removeKey` message for each element in _aCollection_.
The answer is the keys removed.

```
>>> let d = (x: 1, y: 2, z: 3);
>>> (d.removeAllKeys(['x' 'z']), d)
(['x' 'z'], (y: 2))
```

The answer does not contain keys from _aCollection_ that do not exist at _aDictionary_:

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
