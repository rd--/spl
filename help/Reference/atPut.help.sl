# atPut

- _atPut(aCollection, anInteger, anObject)_
- _atPut(c, i, j, v)_ ⇒ _at(c, i).atPut(j, v)_
- _atPut(c, i, j, k, v)_ ⇒ _at(c, i).at(j).atPut(k, v)_

Store _anObject_ at _anInteger_ in _aCollection_.
If the collection does not have indexed variables,
or if the argument is less than one or greater than the number of indexed variables,
then report an error.
Answer _anObject_.

The trait definitions of the extended arity forms are as above.

```
>>> let l = [1 2 3];
>>> l.atPut(2, 'two') = 'two' & { l = [1 'two' 3] }
true
```

- _atPut(aCollection, aKey, anObject)_

Associate _aValue_ with _aKey_ in _aCollection_.
If the collection is not a kind of dictionary then report an error.
If the dictionary does not have an entry for _aKey_ create one.
Answer _anObject_.

```
>>> let r = Record();
>>> r.atPut('x', 1) = 1 & { r.at('x') = 1 }
true
```

There is [AtPut Sytax] for accessing indexed values:

```
>>> let a = ['x', 'y']; a[1] := 'z'; a = ['z', 'y']
true

>>> let d = (x: 1, y: 2); d['x'] := 3; d = (x: 3, y: 2)
true
```

* * *

See also: at, size, [AtPut Syntax]

Categories: Accessing
