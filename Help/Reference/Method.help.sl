# Method

`Method` is the `Type` of the entries in the `Method Dictionary`.

Methods have the fields:

- _arity_: an integer indicating the required number of arguments
- _name_: a string
- _origin_: the name of the `Type` or `Trait` where the method is defined
- _block_: the compiled implementation of the method
- _sourceCode_: the definition of the method, a `String`

The `methodDictionary` is reflected in the `System` type:

```
>>> system.methodDictionary.isDictionary
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
>>> (
>>> 	m.isMethod,
>>> 	m.origin.name,
>>> 	m.block . ([3, 4, 5], { :x | x * x })
>>> )
(true, 'PrimitiveSequence', [9, 16, 25])

>>> collect([3, 4, 5], { :x | x * x })
[9, 16, 25]
```

The `sum` method is implemented at a `Trait`,
the copies at `List` and `Set` are identical:

```
>>> let listSum = system.methodLookupAtType(
>>> 	'sum', 1, 'List'
>>> );
>>> let setSum = system.methodLookupAtType(
>>> 	'sum', 1, 'Set'
>>> );
>>> listSum == setSum
true
```

* * *

See also: methodDictionary, methodLookupAtType, parameterNames, System, Trait, Type

Guides: Defining Methods

Categories: Behaviour, Reflection, Type
