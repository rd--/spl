# setPartition

- _setPartition(x)_

Answer the set partition associated with the object _x_.

At `List`, _x_ must be a restricted growth string.
The set partition _1-2-34_:

```
>>> let s = [1 2 3 3];
>>> (
>>> 	s.isRestrictedGrowthString,
>>> 	s.setPartition
>>> )
(true, [1; 2; 3 4])
```

The set partition _1-2346-5_:

```
>>> let s = [1 2 2 2 3 2];
>>> (
>>> 	s.isRestrictedGrowthString,
>>> 	s.setPartition
>>> )
(true, [1; 2 3 4 6; 5])
```

At `DyckWord`:

```
>>> DyckWord([1 0 1 1 0 0])
>>> .setPartition
[1 2; 3]

>>> DyckWord([1 1 0 1 0 0])
>>> .setPartition
[1; 2 3]

>>> DyckWord([1 1 1 0 0 0])
>>> .setPartition
[1; 2; 3]

>>> DyckWord(
>>> 	[1 0 1 0 1 1 0 1 0 1 1 0 0 0]
>>> ).setPartition
[1 2 3; 4 5 6; 7]
```

Plot the set partition _167-234-5_:

~~~spl svg=A
[1 2 2 2 3 1 1]
.setPartition
.partitionPlot
~~~

![](sw/spl/Help/Image/setPartition-A.svg)

* * *

See also: isRestrictedGrowthString, restrictedGrowthStrings, setPartitions

Guides: Combinatorial Functions, Set Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SetPartition.html),
_W_
[1](https://en.wikipedia.org/wiki/Partition_of_a_set)
