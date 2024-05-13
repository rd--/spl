# dictionaryJoin

- _dictionaryJoin(aCollection)_

Answer a dictionary that has all of the keys of all of the dictionaries in _aCollection_.

```
>>> [(x: 1), (y: 2), (z: 3)].dictionaryJoin
(x: 1, y: 2, z: 3)
```

Keys visited later in the traversal replace existing entries:

```
>>> [(x: 1), (x: 2), (x: 3)].dictionaryJoin
(x: 3)
```

* * *

See also: join, stringJoin
