# methodLookupAtType

- _methodLookupAtType(system, methodName, arity, typeName)_

Answer the `Method` that implements _methodName_ with _arity_ at _typeName_.

Lookup the `collect` method at `List`:

```
>>> let m = system.methodLookupAtType(
>>> 	'collect',
>>> 	2,
>>> 	'List'
>>> );
>>> let f/2 = m.block;
>>> (
>>> 	m.isMethod,
>>> 	f([4 9 16], sqrt/1)
>>> )
(true, [2 3 4])
```

Lookup the `+` method at `Float`:

```
>>> let m = system.methodLookupAtType(
>>> 	'plusSign',
>>> 	2,
>>> 	'Float'
>>> );
>>> let f/2 = m.block;
>>> (
>>> 	m.operatorTokenOrQualifiedName,
>>> 	f(3, 4)
>>> )
('+', 7)
```

* * *

See also: Method, System, Type, perform

Guides: Reflection Functions
