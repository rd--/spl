# hammingDistance

- _hammingDistance(u, v)_

Answer the Hamming distance between vectors _u_ and _v_.

Hamming distance between two strings:

```
>>> 'abc'.hammingDistance('cba')
2
```

Hamming distance between two lists:

```
>>> [1 2 3].hammingDistance([3 2 1])
2
```

Compute distance between any strings of equal length:

```
>>> 'abcdefghijklmn'.hammingDistance(
>>> 	'akmdjbglhfecni'
>>> )
11
```

The _hammingDistance_ is equivalent to _manhattanDistance_ for 0, 1 data:

```
>>> [0 1 1 0 0 1 0].hammingDistance(
>>> 	[1 1 0 0 1 1 0]
>>> )
3

>>> [0 1 1 0 0 1 0].manhattanDistance(
>>> 	[1 1 0 0 1 1 0]
>>> )
3
```

The hammingDistance is greater than or equal to _editDistance_:

```
>>> 'bccbbcb'.hammingDistance('ccbcccb')
4

>>> 'bccbbcb'.editDistance('ccbcccb')
3
```

The number of places at which element differs:

```
>>> [0 0 0 1 1 1].hammingDistance(
>>> 	[0 0 1 1 0 0]
>>> )
3
```

If either side has fewer elements, includes the difference:

```
>>> [0 0 0 1 1 1].hammingDistance(
>>> 	[0 0 1 1 0]
>>> )
3

>>> [0 0 0 1 1].hammingDistance(
>>> 	[0 0 1 1 0 0]
>>> )
3
```

* * *

See also: editDistance, manhattanDistance

Guides: Distance Functions, Similarity Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/HammingDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Hamming_distance)

Further Reading: Hamming 1950

Categories: Distance
