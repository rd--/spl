# removeKeyIfAbsent!

- _removeKeyIfAbsent!(d, k, f/0)_

Remove the element which is stored at _k_ in the dictionary _d_ in-place.
Answer the removed element.
If there is no such item evaluate the no-argument block _f_.

```
>>> let r = (x: 1, z: 3);
>>> let z = r.removeKeyIfAbsent!('z') {
>>> 	nil
>>> };
>>> (z, r)
(3, (x: 1))
```

If no such key exists answer _f()_:

```
>>> let r = (x: 1, z: 3);
>>> r.removeKeyIfAbsent!('y') {
>>> 	true
>>> }
true
```

* * *

See also: remove, removeAllKeys, removeAt, removeKey

References:
_Smalltalk_
5.7.2.17

Categories: Removing
