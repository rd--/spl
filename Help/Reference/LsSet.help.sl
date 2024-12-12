# LsSet

- _LsSet(key, value, aStream)_

Set _key_ to _value_ in _aStream_, the items of which must be dictionaries.

If the key exists, replace the existing value:

```
>>> LsSet(
>>> 	'p',
>>> 	LsSeries(1, 1, 2),
>>> 	LsBind(p: 0, q: 0)
>>> ).upToEnd
[(p: 1, q: 0), (p: 2, q: 0)]
```

If the key does not exist, make an entry:

```
>>> LsSet(
>>> 	'p',
>>> 	LsSeries(1, 1, 2),
>>> 	LsBind(q: 0)
>>> ).upToEnd
[(q: 0, p: 1), (q: 0, p: 2)]
```

* * *

See also: LsBind

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pset.html)

Categories: Stream
