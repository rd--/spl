# Object

`Object` is a `Trait`:

```
>>> system
>>> .traitDictionary['Object']
>>> .isTrait
true
```

Ordinarily all `Type` definitions should implement `Object`:

```
>>> system.traitTypes('@Object').size
system.typeDictionary.size - 1
```

`Object` defines the basic reflection functions:

```
>>> system
>>> .traitDictionary['Object']
>>> .methodDictionary
>>> .keys
>>> .includes('respondsTo:/2')
true
```

Methods for comparing objects:

- `!==`
- `!=`
- `==`
- `=`

Methods for copying objects:

- `copy`
- `shallowCopy`
- `deepCopy`
- `veryDeepCopy`

Methods for displaying and storing objects:

- `printString`
- `printOn`
- `storeString`
- `storeOn`

* * *

See also: Trait

Guides: Reflection Functions

References:
_Smalltalk_
5.3.1

Categories: Value, Trait
