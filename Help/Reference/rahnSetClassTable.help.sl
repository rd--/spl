# rahnSetClassTable

- _rahnSetClassTable(system)_

Answer a `Record` giving the Forte pitch-class set table with prime forms given according to the algorithm by Rahn.

```
>>> system.rahnSetClassTable
>>> .atAll(
>>> 	[
>>> 		'5-20'
>>> 		'6-Z29' '6-31'
>>> 		'7-Z18' '7-20'
>>> 		'8-26'
>>> 	]
>>> )
(
	'5-20': [0 1 5 6 8],
	'6-Z29': [0 2 3 6 7 9],
	'6-31': [0 1 4 5 7 9],
	'7-Z18': [0 1 4 5 6 7 9],
	'7-20': [0 1 2 5 6 7 9],
	'8-26': [0 1 3 4 5 7 8 10]
)
```

Check that `rahnPrimeForm` answers correctly:

```
>>> system.rahnSetClassTable
>>> .allSatisfy { :p |
>>> 	p.rahnPrimeForm = p
>>> }
true
```

* * *

See also: forteNumber, forteSetClassTable, rahnPrimeForm

Guides: Atonal Theory Functions

Further Reading: Rahn 1980
