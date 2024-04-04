# removeAllSuchThat

- _removeAllSuchThat(aCollection, aBlock:/1)_

Evaluate _aBlock_ for each element of _aCollection_ and remove all elements that evaluate to true.
Use a copy to enumerate collections whose order changes when an element is removed (i.e. sets).

```
>>> let c = [1 2 2 3 3 3 4 4 4 4];
>>> c.removeAllSuchThat { :each | [2 3].includes(each) };
>>> c
[1 4 4 4 4]
```

_Note:_
This is defined at `Dictionary`, where the argument to _aBlock_ will be an `Association`.

* * *

See also: reject, remove, keysAndValuesRemove

Categories: Removing
