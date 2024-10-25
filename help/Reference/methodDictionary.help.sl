# methodDictionary

- _methodDictionary(aSystem | aTrait | aType)_

Fetch the `Method Dictionary` of the `System` or of a `Trait` or `Type`.

At `Trait` and `Type` the method dictionaries are keyed by qualified method names,
and the entries are methods.

The method dictionary of `String`:

```
>>> let t = [1 2 3].typeDefinition;
>>> let d = t.methodDictionary;
>>> (d.isDictionary, d['isList:/1'].isMethod)
(true, true)
```

The method dictionary of `String`:

```
>>> let t = 'text'.typeDefinition;
>>> let d = t.methodDictionary;
>>> (d.isDictionary, d['isString:/1'].isMethod)
(true, true)
```

The system method dictionary is keyed by unqualified method names:
and the entries are dictionaries:

```
>>> let d = system.methodDictionary;
>>> (d.isDictionary, d['collect'].isDictionary)
(true, true)
```

The secondary dictionares are keyed by arity,
and the entries are likewise dictionaries:

```
>>> let d = system.methodDictionary;
>>> d['collect'][2].isDictionary
true
```

The tertiary dictionaries are keyed by type,
and the entries are methods:

```
>>> let d = system.methodDictionary;
>>> d['collect'][2]['List'].isMethod
true
```

* * *

See also: methodLookupAtType, Method Dictionary, System

Categories: Reflection, System
