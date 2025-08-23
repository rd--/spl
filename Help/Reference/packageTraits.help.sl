# packageTraits

- _packageTraits(s, p)_

At `System`,
answer the `List` of `Trait`s defined in the named `Package` _p_.

```
>>> let t = system.packageTraits(
>>> 	'Iterable'
>>> );
>>> (t.size, t[1].name)
(1, 'Iterable')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTypes, Trait

Guides: Reflection Functions
