# catenate

- _catenateValues([c₁ c₂ …])_

Collects the values in the collections _c_ into a `List`.
If _isStrict_ is `true`,
each of the items in _c_ must be of the same type as the container.

At a `List` of `Record` answers the `catenate` of the values,
see `dictionaryJoin` for a _merge_ function:

```
>>> [(x: 1), (y: 2), (z: 3)].catenateValues
[1 2 3]
```

At `List` of `String`:

```
>>> ['abc' 'pqr' 'xyz'].catenateValues
['a' 'b' 'c' 'p' 'q' 'r' 'x' 'y' 'z']
```

Is `identity` at the empty `List`:

```
>>> [].catenateValues
[]
```

* * *

See also: ++, +++, catenate, flatten, join

Guides: Dictionary Functions, List Functions
