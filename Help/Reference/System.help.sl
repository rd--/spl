# System

A `Type` representing the system (interpreter and host).

The global value `system` is the singular instance.

Type, trait and method dictionaries, timers, random number and unique identifier generators are implemented at `System`.

```
>>> system.typeOf
'System'
```

The package dictionary:

```
>>> let d = system.packageDictionary;
>>> d.includesKey('Colour')
true
```

The method dictionary:

```
>>> let d = system.methodDictionary;
>>> d.includesKey('includesKey')
true
```

The trait dictionary:

```
>>> let d = system.traitDictionary;
>>> d.includesKey('Collection')
true
```

The type dictionary:

```
>>> let d = system.typeDictionary;
>>> d.includesKey('System')
true
```

System implements `RandomNumberGenerator`:

```
>>> system.nextRandomFloat < 1
true
```

System can act as a source of unique identifiers:

```
>>> let p = system.uniqueIdentifier;
>>> let q = system.uniqueIdentifier;
>>> p != q
true
```

* * *

See also: Cache, methodDictionary, packageDictionary, traitDictionary, typeDictionary, system

Guides: Reflection Functions, System Functions

Categories: System, Type
