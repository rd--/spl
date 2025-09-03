# isNotEmpty

- _isNotEmpty(c)_

Answers whether the collection _c_ contains any elements.
Negation of _isEmpty_.

At `List`:

```
>>> [].isNotEmpty
false
```

At `Record`:

```
>>> (:).isNotEmpty
false
```

At `Map`:

```
>>> [:].isNotEmpty
false
```

At `String`:

```
>>> ''.isNotEmpty
false
```

* * *

See also: isEmpty, size

Guides: Dictionary Functions, List Functions

References:
_Smalltalk_
5.7.1.18

Categories: Testing
