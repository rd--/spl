# methodLookupAtType

- _methodLookupAtType(aSystem, methodName, arity, typeName)_

Answer the `Method` that implements _methodName_ with _arity_ at _typeName_.

```
>>> let m = system.methodLookupAtType('collect', 2, 'List');
>>> (m.isMethod, m.block . ([4 9 16], sqrt:/1))
(true, [2 3 4])

>>> let m = system.methodLookupAtType('plusSign', 2, 'SmallFloat');
>>> (m.operatorNameOrQualifiedName, m.block . (3, 4))
('+', 7)
```

* * *

See also: Method, perform, System, Type

Categories: Reflection
