# lookup

- _lookup(d, key, m=nil)_

Look up the value associated with _key_ in the dictionary _d_,
if the key is not present the `value` of _m_ is given.

Look up the value associated with the key:

```
>>> (a: 1, b: 2).lookup('a', nil)
1
```

When a key is not found, answer the `value` of the _defaultAnswer_:

```
>>> (a: 1, b: 2).lookup('c', nil)
nil

>>> (a: 1, b: 2).lookup('c', 0)
0
```

Look up multiple keys at once:

```
>>> (a: 1, b: 2).lookup(['a' 'b' 'c'], nil)
[1 2 nil]
```

Threads over lists of dictionaries:

```
>>> [
>>> 	(a: 1, b: 2),
>>> 	(a: 3, b: 1),
>>> 	(a: 4, b: 3)
>>> ].lookup('a', nil)
[1 3 4]

>>> [(a: 1, b: 2), (a: 3)].lookup('a', nil)
[1 3]
```

Query multiple keys from multiple dictionaries:

```
>>> [
>>> 	(a: 1, b: 2),
>>> 	(a: 3, b: 1),
>>> 	(a: 4, b: 3)
>>> ].lookup(['a' 'b'], nil)
[1 2; 3 1; 4 3]
```

Use `error` as default value:

```
>>> let bmi = { :d |
>>> 	let [w, h] = d.lookup(
>>> 		['weight', 'height'],
>>> 		{ d.error('bmi') }
>>> 	);
>>> 	w / (h ^ 2)
>>> };
>>> (
>>> 	(weight: 90, height: 1.8).bmi,
>>> 	{ ().bmi }.ifError { nil }
>>> )
(27.7778, nil)
```

_Rationale_:
Where `at` and `atIfAbsent` are defined at `List` as indexing methods,
`lookup` is defined only at `Dictionary`,
and can therefore thread over `List` values,
both of dictionaries and keys.
Unlike `atAll`, the answer gives only the values, in sequence.

* * *

See also: at, atAll, atIfAbsent, Dictionary, includesKey, Map, Record

Guides: Dictionary Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Lookup.html)
