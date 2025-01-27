# associationsRemove

- _associationsRemove(aDictionary, aBlock:/1)_

Remove entries from _aDictionary_ where _aBlock_ answers `true` for the `Association`.

Consider only key:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> let z = r.associationsRemove { :each |
>>> 	each.key = 'y'
>>> };
>>> (r, z)
((x: 1, z: 3), ['y'])
```

Consider only value, see also `removeAllSuchThat`:

```
>>> let r = (x: 1, y: 2, z: 3);
>>> let z = r.associationsRemove { :each |
>>> 	each.value.isOdd
>>> };
>>> (r, z)
((y: 2), ['x' 'z'])
```

* * *

See also: Dictionary, removeAllSuchThat
