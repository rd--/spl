# typeDictionary

- _typeDictionary(aSystem)_

A `Dictionary` at `System` to hold the set of `Type`s:

```
>>> system.typeDictionary.isDictionary
true

>>> system.typeDictionary.elementType
'Type'
```

`List` is a type:

```
>>> system.typeDictionary.includesKey('List')
true

>>> system.typeDictionary['List'].isType
true
```

`isList` is a method at type `List`:

```
>>> let t = system.typeDictionary['List'];
>>> t.methodDictionary.includesKey('isList:/1')
true
```

Find the types that have a slot named _cache_:

```
>>> system.typeDictionary.select { :each |
>>> 	each.slotNameList.includes('cache')
>>> }.keys
['BezierCurve' 'Markdown' 'HelpFile' 'RatioTuning']
```

* * *

See also: methodDictionary, packageDictionary, System, traitDictionary, Type

Categories: Reflection, System
