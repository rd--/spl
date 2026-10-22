# Method

`Method` is the `Type` of the entries in the `Method Dictionary`.

Methods have the fields:

- `arity`: the required number of arguments
- `name`: the unqualified method name
- `origin`: the type or trait where the method is defined
- `block`: the compiled implementation of the method
- `sourceCode`: the definition of the method

The `methodDictionary` is reflected in the `System` type:

```
>>> system.methodDictionary
>>> .isDictionary
true
```

The keys are unqualified method names:

```
>>> let d = system.methodDictionary;
>>> d.includesKey('collect')
true
```

`methodLookupAtType` answers a method given an unqualified name, an arity and a type name:

```
>>> let m = system.methodLookupAtType(
>>> 	'collect',
>>> 	2,
>>> 	'List'
>>> );
>>> let f/2 = m.block;
>>> (
>>> 	m.isMethod,
>>> 	m.origin.name,
>>> 	f([3 4 5], { :x | x * x })
>>> )
(true, '@PrimitiveArray', [9 16 25])

>>> [3 4 5].collect { :x | x * x }
[9 16 25]
```

The `sum` method is implemented at a `Trait`,
the copies at `List` and `SortedSet` are identical:

```
>>> let listSum = system.methodLookupAtType(
>>> 	'sum', 1, 'List'
>>> );
>>> let setSum = system.methodLookupAtType(
>>> 	'sum', 1, 'SortedSet'
>>> );
>>> listSum == setSum
true
```

* * *

See also: System, Trait, Type, methodDictionary, methodLookupAtType, parameterNames

Guides: Defining Methods, Reflection Functions

Categories: Behaviour, Reflection, Type
