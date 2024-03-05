# indexOfIfAbsent

- _indexOf(aCollection, anElement, exceptionBlock:/0)_

Answer the index of the first occurence of _anElement_ within _aCollection_.
If the collection does not contain _anElement_, answer the result of evaluating _exceptionBlock_.

```
>>> [1 2 3 2 3].indexOfIfAbsent(3) { true }
3

>>> [1 2 3 2 3].indexOfIfAbsent(4) { true }
true
```

* * *

See also: indexOf

References:
_Smalltalk_
5.7.8.21

Categories: Accessing
