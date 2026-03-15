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

Binary Hamming distance between _P(n)_ and _P(n+1)_,
OEIS [A205510](https://oeis.org/A205510):

```
>>> 1:21.collect { :n |
>>> 	n.prime.hammingDistance(
>>> 		(n + 1).prime
>>> 	)
>>> }
[1 2 1 2 2 3 1 1 2 1 4 2 1 1 3 3 2 6 1 3 2]
```

Binary Hamming distance between _(n-1)!_ and _n!_,
OEIS [A205509](https://oeis.org/A205509):

```
>>> 1L:23.collect { :n |
>>> 	(n - 1).integerFactorial
>>> 	.hammingDistance(
>>> 		n.integerFactorial
>>> 	)
>>> }
[
	 0  2  1  4  2  4  4  6  4  9
	 8 15 12 16 14 12 16 23 26 23
	21 29 31
]
```

An array,
read by antidiagonals,
of the Hamming distance between _k_ and the Gray encoding of the sum of _n_ and the Gray decoding of _k_,
OEIS [A268833](https://oeis.org/A268833):

~~~spl svg=A oeis=A268833
0:12.antidiagonalArray { :n :k |
	k.hammingDistance(
		(n + k.grayDecode).grayEncode
	)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/hammingDistance-A.svg)

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
