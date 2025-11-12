# Json

`Json` is a `Trait` for types that have an encoding in Json (JavaScript Object Notation).

```
>>> system
>>> .traitDictionary['Json']
>>> .isTrait
true
```

Types implementing `Json`:

```
>>> system
>>> .traitTypes('Json')
>>> .sort
[
	'Boolean'
	'List'
	'Nil'
	'Record'
	'SmallFloat'
	'String'
]
```

Json is a simple plain text data-interchange format.

The types implementing the trait are:

- `Boolean`
- `List`
- `Nil`
- `Record`
- `SmallFloat`
- `String`

* * *

See also: asJson, Boolean, isJson, json, List, parseJson, Nil, Record, SmallFloat, String

Guides: String Functions

References:
_Json_
[1](https://www.json.org/json-en.html)

Further Reading: Crockford 2006

Categories: Protocol, Trait
