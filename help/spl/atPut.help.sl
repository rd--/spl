# atPut -- accessing

- _atPut(anIndexableCollection, anIndex, aValue)_

Store _aValue_ at _anIndex_ in _anIndexableCollection_.

If the receiver does not have indexed variables, or if the argument is less than one or greater than the number of indexed variables, then report an error.

- _atPut(aKeyedCollection, aKey, aValue)_

Associate _aValue_ with _aKey_ in _aKeyedCollection_.
If the receiver does not have an entry for _aKey_ create one.

* * *

See also: at, size, [AtPut Syntax]
