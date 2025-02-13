# parseMethodSignature

- _parseMethodSignature(aString)_

Answer a `List` of two places giving the holder and selector of a method signature.

```
>>> 'List>>sum:/1'
>>> .parseMethodSignature
[
	'List'
	'sum:/1'
]

>>> '@Iterable>>count:/1'
>>> .parseMethodSignature
[
	'@Iterable'
	'count:/1'
]
```

* * *

Categories: Reflection
