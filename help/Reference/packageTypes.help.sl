# packageTypes

- _packageTypes(aSystem, aString)_

Answer the `List` of `Type`s defined in the named `Package`.

```
>>> let typeList = system.packageTypes('Complex');
>>> (typeList.size, typeList[1].category)
(1, 'Number')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTraits, Type
