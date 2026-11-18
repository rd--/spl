# traitNameList

- _traitNameList(t)_

Answer a `List` of the `Trait` names implemented by the `Type` _t_.

```
>>> 23.0.typeDefinition.name
'Float'

>>> 23.0.typeDefinition
>>> .traitNameList
>>> .sort!
[
	'@Binary'
	'@Compare'
	'@Copy'
	'@Equal'
	'@ImplicitInteger'
	'@Json'
	'@Number'
	'@Object'
	'@Store'
]
```

* * *

See also: Trait, Type

Guides: Reflection Functions
