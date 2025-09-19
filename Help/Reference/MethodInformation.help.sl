# MethodInformation

`MethodInformation` is a `Type` holding information about a `Method`.

Lookup method in the `System` method dictionary and collate information:

```
>>> let i = system
>>> .methodDictionary
>>> .atPath(['collect' 2 'List'])
>>> .information;
>>> (
>>> 	i.arity,
>>> 	i.name,
>>> 	i.origin.isTrait,
>>> 	i.origin.name,
>>> 	i.packageName,
>>> 	i.parameterNames
>>> )
(
	2,
	'collect',
	true,
	'PrimitiveSequence',
	'PrimitiveSequence',
	['self', 'aBlock:/1']
)
```

* * *

See also: Method

Guides: Reflection Functions
