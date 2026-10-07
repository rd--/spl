# UrlQueryParameters

- _UrlQueryParameters(x)_

A `Trait` and associated `Type` holding the parsed query parameters of a `Url`.

This object is somewhat like a dictionary, however it allows duplicate keys.

Implements `size`, `associations`, `keys`, `values` and `queryString`.

```
>>> let u = Url'x://?p=i&q=j';
>>> let q = u.queryParameters;
>>> (q.size, q.associations, q.queryString)
(2, ['p' -> 'i', 'q' -> 'j'], 'p=i&q=j')
```

At `String`:

```
>>> let q = UrlQueryParameters'x=3.141&y=23';
>>> (
>>> 	q.isUrlQueryParameters,
>>> 	q.includes('x')
>>> )
(true, true)
```

At `Record`, values must be of type `String`:

```
>>> let q = UrlQueryParameters(x: '3.141', y: '23');
>>> q['y']
'23'
```

Duplicate keys:

```
>>> let q = UrlQueryParameters'x=i&x=j';
>>> (
>>> 	q.size,
>>> 	q.associations,
>>> 	q.keys,
>>> 	q.values,
>>> 	q.queryString
>>> )
(
	2,
	['x' -> 'i', 'x' -> 'j'],
	['x', 'x'],
	['i', 'j'],
	'x=i&x=j'
)
```

Note that the type has the non-standard name `URLSeachParams`, which is defined by the system.

* * *

See also: Url, associations, keys, queryParameters, queryString, size, values

Guides: Network Functions

Categories: Network, Address
