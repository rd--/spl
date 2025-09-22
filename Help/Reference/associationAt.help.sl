# associationAt

- _associationAt(aDictionary, key)_

Answer the association with the given _key_ at _aDictionary_.
If _key_ is not found, signal an `error`.

```
>>> (x: 1, y: 2).associationAt('y')
('y' -> 2)

>>> {
>>> 	(x: 1, y: 2).associationAt('z')
>>> }.hasError
true
```

* * *

See also: associations, associationAtIfAbsent, indexValueAssociations

Categories: Accessing
