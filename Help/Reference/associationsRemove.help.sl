# associationsRemove

- _associationsRemove(d, f/1)_

Remove entries from the dictionary _d_ where the block _f_ answers `true` for the `Association`.
Answers a list of the keys removed.

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
