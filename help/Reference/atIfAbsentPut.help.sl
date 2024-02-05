# atIfAbsentPut

- _atIfAbsentPut(aDictionary, aKey, aBlock:/0)_

Answer the element in _aDictionary_ at _aKey_.
If the key is absent, add the result of evaluating _aBlock_ to _aDictionary_ at _aKey_ and answer that value.

```
>>> let r = (x: 1, y: 2);
>>> r.atIfAbsentPut('y') { nil }
2

>>> let r = ();
>>> let z = r.atIfAbsentPut('x') { 1 };
>>> (r, z)
((x: 1), 1)
```
* * *

See also: at, atIfPresent

Categories: Accessing
