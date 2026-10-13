# packageTraits

- _packageTraits(s, p)_

At `System`,
answer the `List` of `Trait`s defined in the named `Package` _p_.

```
>>> let t = system.packageTraits(
>>> 	'Do'
>>> );
>>> (t.size, t[1].name)
(1, 'Do')
```

* * *

See also: Package, packageDictionary, packageMethods, packageTypes, Trait

Guides: Reflection Functions
