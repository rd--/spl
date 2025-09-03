# includesKey

- _includesKey(d, k)_

Answer whether the dictionary _d_ has a key equal to _k_.

At `Record`:

```
>>> (Italie: 'Rome', France: 'Paris')
>>> .includesKey('France')
true

>>> (x: 1, y: 2, z: 3).includesKey('z')
true

>>> (x: 1, y: 2, z: 3).includes(3)
true
```

At `Map`:

```
>>> ['w': 1, 'x': 2, 'y': 3]
>>> .includesIndex('x')
true
```

_Rationale:_
The indices of dictionaries are called keys.
`includesKey` is another name for `includesIndex`,
and `keys` is another name for `indices`.

```
>>> (x: 1, y: 2, z: 3).includesIndex('z')
true
```

* * *

See also: at, Dictionary, includes, includesIndex, Indexable, keys

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/KeyExistsQ.html)
_Smalltalk_
5.7.2.7

Categories: Testing
