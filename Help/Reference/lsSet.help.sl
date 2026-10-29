# lsSet

- _lsSet(key, value, aStream)_

Set _key_ to _value_ in _aStream_, the items of which must be dictionaries.

If the key exists, replace the existing value:

```
>>> lsSet(
>>> 	'p',
>>> 	lsSeries(1, 1, 2),
>>> 	lsBind(p: 0, q: 0)
>>> ).upToEnd
[(p: 1, q: 0), (p: 2, q: 0)]
```

If the key does not exist, make an entry:

```
>>> lsSet(
>>> 	'p',
>>> 	lsSeries(1, 1, 2),
>>> 	lsBind(q: 0)
>>> ).upToEnd
[(q: 0, p: 1), (q: 0, p: 2)]
```

* * *

See also: lsBind

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pset.html)

Categories: Stream
