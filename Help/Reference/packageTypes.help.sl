# packageTypes

- _packageTypes(aSystem, aString)_

Answer the `List` of `Type`s defined in the named `Package`.

```
>>> let t = system.packageTypes('Complex');
>>> (t.elementType, t.size, t[1].name, t[1].category)
('Type', 1, 'Complex', 'Number')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTraits, Type
