# parseMethodSignature

- _parseMethodSignature(s)_

Answer a `List` of two places giving the holder and selector of the method signature _s_.

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

See also: asMethodName, Method, parseQualifiedMethodName

Guides: Reflection Functions

Categories: Reflection
