# localeCompare

- _localeCompare(s₁, s₂, l)_
- _localeCompare(l)_

Compare two strings using the locale _l_.

```
>>> let a = 'reserve';
>>> let b = 'réservé';
>>> localeCompare(a, b, 'fr')
-1

>>> 'check'.localeCompare(
>>> 	'against',
>>> 	'en'
>>> )
1
```

The unary form answers a compare block for the indicated locale,
sort a `List`:

```
>>> [
>>> 	'réservé'
>>> 	'Premier'
>>> 	'Cliché'
>>> 	'communiqué'
>>> 	'café'
>>> 	'Adieu'
>>> ].sortComparing(
>>> 	'fr'.localeCompare
>>> )
[
	'Adieu'
	'café'
	'Cliché'
	'communiqué'
	'Premier'
	'réservé'
]
```

* * *

See also: compare, less, lexicographicCompare, localeSort

Guides: String Functions
