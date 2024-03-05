# collectInto

- _collectInto(aCollection, aBlock:/1, anotherCollection)_

Evaluate _aBlock_ with each elements of _aCollection_ as the argument.
Collect the resulting values into _anotherCollection_.
Answer _anotherCollection_.

```
>>> let list = List(4);
>>> [1 3 5 7].collectInto({ :each | each * each}, list);
>>> list
[1 9 25 49]
```

* * *

See also: collect

Categories: Enumerating
