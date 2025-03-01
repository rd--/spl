# differenceAll

- _differenceAll(aCollection, anotherCollection)_

Answer a value like _aCollection_ that contains elements from _aCollection_ that
do not occur in any collection that is an element of _anotherCollection_.

```
>>> 1:75.differenceAll(
>>> 	[
>>> 		13:18, 22:27, 31:36,
>>> 		40:45, 49:57, 61:65
>>> 	]
>>> )
[
	1:12, 19:21, 28:30,
	37:39, 46:48, 58:60,
	66:75
].catenate
```

* * *

See also: difference

Categories: Set, Logic
