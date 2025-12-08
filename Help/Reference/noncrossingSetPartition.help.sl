# noncrossingSetPartition

- _noncrossingSetPartition(w)_

Answer the noncrossing set partition associated with the Dyck word _w_,
using the bijection due to Prodinger.

The ascents are numbered left to right,
each descent is labeled according to the matching ascent,
the blocks are the sets of descents.

```
>>> DyckWord([1 0 1 0])
>>> .noncrossingSetPartition
[1; 2]

>>> DyckWord([1 1 0 0 1 1 0 0])
>>> .noncrossingSetPartition
[2 1; 4 3]

>>> DyckWord(
>>> 	[
>>> 		1 1 1 0 1 1 0 0 0
>>> 		1 1 0 0 0 1 1 0 0
>>> 	]
>>> ).noncrossingSetPartition
[3; 5 4 2; 7 6 1; 9 8]
```

* * *

See also: DyckWord, setPartition

Guides: Combinatorial Functions

Further Reading: Callan 2008
