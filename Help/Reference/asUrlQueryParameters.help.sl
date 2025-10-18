# asUrlQueryParameters

- _asUrlQueryParameters(x)_

Answer a `UrlQueryParameters` value, which is somewhat like a dictionary, however it allows duplicate keys.

At `String`:

```
>>> let s = 'x=3.141&y=23';
>>> let q = s.asUrlQueryParameters;
>>> (
>>> 	q.isUrlQueryParameters,
>>> 	q.includes('x')
>>> )
(true, true)
```

At `Record`, values must be of type `String`:

```
>>> let r = (x: '3.141', y: '23');
>>> let q = r.asUrlQueryParameters;
>>> q['y']
'23'
```

Duplicate keys:

```
>>> let s = 'x=i&x=j';
>>> let q = s.asUrlQueryParameters;
>>> (
>>> 	q.size,
>>> 	q.associations,
>>> 	q.keys,
>>> 	q.values,
>>> 	q.asString
>>> )
(
	2,
	['x' -> 'i', 'x' -> 'j'],
	['x', 'x'],
	['i', 'j'],
	'x=i&x=j'
)
```

* * *

See also: Url, UrlQueryParameters

Guides: Network Functions

Categories: Network, Address
