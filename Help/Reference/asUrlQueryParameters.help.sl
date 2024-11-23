# asUrlQueryParameters

- _asUrlQueryParameters(aString | aRecord)_

Answer a `UrlQueryParameters` value, which is somewhat like a dictionary, however it allows duplicate keys.

At `String`:

```
>>> let q = 'x=3.141&y=23'.asUrlQueryParameters;
>>> (q.isUrlQueryParameters, q.includes('x'))
(true, true)
```

At `Record`, values must be of type `String`:

```
>>> let q = (x: '3.141', y: '23').asUrlQueryParameters;
>>> q['y']
'23'
```

Duplicate keys:

```
>>> let q = 'x=i&x=j'.asUrlQueryParameters;
>>> (q.size, q.associations, q.keys, q.values, q.asString)
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

Categories: Network, Address
