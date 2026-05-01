# splOeisReferences

- _splOeisReferences(system)_

Answer a `Record` where the keys are help topics and the values are lists of OEIS identifiers.

Count entries:

```
>>> system.splOeisReferences.size
673
```

Count unique OEIS identitfiers:

```
>>> system.splOeisReferences
>>> .values.catenate.unique.size
2897
```

Lookup OEIS references at `zeta`:

```
>>> system.splOeisReferences.at('zeta')
['A013631' 'A013661']
```

* * *

See also: OeisEntry, OeisSequenceFile, oeisImageIndex

Guides: Integer Sequence Functions
