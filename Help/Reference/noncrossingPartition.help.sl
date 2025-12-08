# noncrossingPartition

- _noncrossingPartition(w)_

Answer the non-crossing set partition associated with the Dyck word _w_.

```
>>> DyckWord([1 0 1 0])
>>> .noncrossingPartition
[1; 2]

>>> DyckWord([1 1 0 0 1 1 0 0])
>>> .noncrossingPartition
[2 1; 4 3]

>>> DyckWord(
>>> 	[
>>> 		1 1 1 0 1 1 0 0 0
>>> 		1 1 0 0 0 1 1 0 0
>>> 	]
>>> ).noncrossingPartition
[3; 5 4 2; 7 6 1; 9 8]
```

* * *

See also: DyckWord

Guides: Combinatorial Functions

Further Reading: Callan 2008
