# reject

- _reject(aCollection, aBlock:/1)_

Evaluate _aBlock_ with each of the elements of _aCollection_ as the argument.
Collect into a new collection like the receiver only those elements for which _aBlock_ evaluates to _false_.
Answer the new collection.

```
>>> 1:9.reject(isEven:/1)
[1 3 5 7 9]
```

* * *

See also: collect, detect, select

References:
_Smalltalk_
5.7.1.21

Categories: Enumerating
