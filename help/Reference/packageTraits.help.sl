# packageTraits

- _packageTraits(aSystem, aString)_

Answer the `List` of `Trait`s defined in the named `Package`.

```
>>> let traitList = system.packageTraits('Iterable');
>>> (traitList.size, traitList[1].name)
(1, 'Iterable')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTypes, Trait
