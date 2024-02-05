# at

- _at(aCollection, anIndex)_
- _atPut(c, i, j, v)_ ⇒ _at(c, i).atPut(j, v)_
- _atPut(c, i, j, k, v)_ ⇒ _at(c, i).at(j).atPut(k, v)_

Answer the item associated with _anIndex_ in _aCollection_.

If the collection does not support indexing,
or if the index is not valid,
report an _error_.

The trait definitions of the extended arity forms are as above.

Lists (and all sequenceable collections) are indexable:

```
>>> ['x', 'y'].at(1)
'x'

>>> { ['x', 'y'].at(3) }.ifError { true }
true
```

Records (and all dictionaries) are indexable:

```
>>> (x: 1, y: 2).at('x')
1

>>> { (x: 1, y: 2).at('z') }.ifError { true }
true
```

Sets and Bags are not indexable:

```
>>> { [1 2 3].asSet.at(1) }.ifError { true }
true

>>> { [1 2 3].asBag.at(1) }.ifError { true }
true
```

There is [At Sytax] for accessing indexed values:

```
>>> let l = ['x', 'y'];
>>> l[1]
'x'

>>> let d = (x: 1, y: 2);
>>> d['x']
1
```

Collections may implement extended arity forms as required.

* * *

See also: atPut, [AtPut Syntax], [At Syntax], Indexable, [Quoted At Syntax], size

Categories: Accessing
