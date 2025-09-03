# indexOfIfAbsent

- _indexOf(c, x, f:/0)_

Answer the index of the first occurence of the object _x_ within the sequential collection _c_.
If the collection does not contain _x_, answer the result of evaluating the exception block _f_.

```
>>> [1 2 3 2 3].indexOfIfAbsent(3) { true }
3

>>> [1 2 3 2 3].indexOfIfAbsent(4) { true }
true
```

* * *

See also: indexOf

Guides: Indexing Functions, List Functions

References:
_Smalltalk_
5.7.8.21

Categories: Accessing
