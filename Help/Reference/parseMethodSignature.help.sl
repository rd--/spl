# parseMethodSignature

- _parseMethodSignature(s)_

Answer a `List` of two places giving the holder and selector of the method signature _s_.

```
>>> 'List>>sum/1'
>>> .parseMethodSignature
[
	'List'
	'sum/1'
]

>>> '@Do>>count/1'
>>> .parseMethodSignature
[
	'@Do'
	'count/1'
]
```

* * *

See also: Method, asMethodName, parseQualifiedMethodName

Guides: Reflection Functions
