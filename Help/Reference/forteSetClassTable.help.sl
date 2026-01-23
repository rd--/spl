# forteSetClassTable

- _forteSetClassTable(system)_

Answer a `Record` giving the Forte pitch-class set table with prime forms given according to the algorithm by Forte.

Show cases where the Forte and Forte prime forms differ:

```
>>> system.forteSetClassTable
>>> .reject { :p |
>>> 	p.rahnPrimeForm = p
>>> }
(
	'5-20': [0 1 3 7 8],
	'6-Z29': [0 1 3 6 8 9],
	'6-31': [0 1 3 5 8 9],
	'7-Z18': [0 1 2 3 5 8 9],
	'7-20': [0 1 2 4 7 8 9],
	'8-26': [0 1 2 4 5 7 9 10]
)
```

* * *

See also: forteName, rahnSetClassTable

Further Reading: Forte 1973
