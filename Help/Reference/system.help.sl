# system

`system` is the name of the singular instance of the `System` type.

`system` holds the `methodDictionary`:

```
>>> system
>>> .methodDictionary
>>> .size.round(25)
7200

>>> system
>>> .methodDictionary
>>> .keys
>>> .includes('sum')
true
```

`system` holds the `traitDictionary`:

```
>>> system
>>> .traitDictionary
>>> .size.round(5)
55

>>> system
>>> .traitDictionary
>>> .keys
>>> .includes('@Collection')
true
```

`system` holds the `typeDictionary`:

```
>>> system
>>> .typeDictionary
>>> .size.round(10)
270

>>> system
>>> .typeDictionary
>>> .keys
>>> .includes('List')
true
```

* * *

See also: Method, Package, System, Trait, Type

Guides: Reflection Functions, System Functions, System Variable
