# LsSet

- _LsSet(key, value, aStream)_

Set _key_ to _value_ in _aStream_.

```
>>> LsSet('p', LsSeries(1, 1, 2), LsBind(q: 0)).upToEnd
[(q: 0, p: 1), (q: 0, p: 2)]
```

* * *

See also: LsBind
