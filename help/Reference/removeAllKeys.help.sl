# removeAllKeys

- _removeAllKeys(aDictionary, aCollection)_

Remove any elements from _aDictionary_ which are stored at the keys specified in _aCollection_.
This message has the same effect on the receiver as repeatedly sending the `removeKey` message for each element in _aCollection_.
The answer is `undefined` if duplicate keys, as defined by key equivalence, are in the keys or if any element in keys is not a valid key of the receiver.

* * *

See also: removeKey

References:
_Smalltalk_
5.7.2.11

Categories: Removing
