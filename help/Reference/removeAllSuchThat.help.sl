# removeAllSuchThat

- _removeAllSuchThat(aCollection, aBlock:/1)

Evaluate _aBlock_ for each element of _aCollection_ and remove all elements that evaluate to true.
Use a copy to enumerate collections whose order changes when an element is removed (i.e. Sets).

_Note:_
This is defined at `Dictionary`, where the argument to _aBlock_ will be an `Association`.

* * *

See also: reject, remove, keysAndValuesRemove

Categories: Removing
