# packageMethods

- _packageMethods(aSystem, aString)_

Answer the `List` of `Method`s defined in the named `Package`.

Find the definitions of `asHert` in the _Frequency_ package:

```
>>> let m = system.packageMethods('Frequency');
>>> m.select { :each |
>>> 	each.name = 'asHertz'
>>> }.collect { :each |
>>> 	(each.origin.name, each.arity)
>>> }
[('Number', 1), ('Frequency', 1)]
```

* * *

See also: Package, packageDictionary, packageTraits, packageTypes
