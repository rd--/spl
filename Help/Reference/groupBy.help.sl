# groupBy

- _groupBy(aCollection, keyBlock:/1)_

Like in Sql answer the contents of _aCollection_ split into groups for which _keyBlock_ returns the same results.
The answer is a `Map` keyed by the answers of _keyBlock_.

```
>>> [1 .. 5].groupBy(isEven:/1)
[
	(false -> [1 3 5]),
	(true -> [2 4])
].asMap

>>> [1 .. 5].groupBy(isEven:/1).keys
[false, true]

>>> [1 .. 5].groupBy(isEven:/1)[true]
[2, 4]

>>> [
>>> 	'it' 'was' 'the' 'best' 'of' 'times'
>>> 	'it' 'was' 'the' 'worst' 'of' 'times'
>>> ].groupBy(size:/1)
[
	2 -> ['it', 'of', 'it', 'of'],
	3 -> ['was', 'the', 'was', 'the'],
	4 -> ['best'],
	5 -> ['times', 'worst', 'times']
].asMap
```

* * *

See also: countsBy, reject, select

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GroupBy.html)

Categories: Enumerating
