# asAssociation

- _asAssociation(anObject)_

Answer an `Association` if _anObject_ can be converted to one.

At `List`:

```
>>> ['x' 1].asAssociation
'x' -> 1
```

At `Association`:

```
>>> ('x' -> 1).asAssociation
'x' -> 1
```

* * *

See also: asList, asTuple

Categories: Converting
