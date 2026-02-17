# indicesOf

- _indicesOf(c, x)_

Answer a `List`, possibly empty, of all the indices of the object _x_ in the collection _c_.

At `List`:

```
>>> [0 0 1 0 1 0].indicesOf(1)
[3 5]

>>> ([3 1 4] > [1 5 9]).indicesOf(true)
[1]

>>> [1 2 3 2 3 4 3 4 5].indicesOf(3)
[3 5 7]

>>> [1 2 3; 2 3 4; 3 4 5].indicesOf([2 3 4])
[2]
```

At `Record`:

```
>>> (x: 1, y: 2, z: 1).indicesOf(1)
['x' 'z']
```

At `String`:

```
>>> 'once at end'.indicesOf('d')
[11]

>>> 'abracadabra'.indicesOf('a')
[1 4 6 8 11]
```

At `String` with non-character seach string:

```
>>> 'abracadabra'.indicesOf('ab')
[1 8]
```

Plot squarefree numbers ordered lexicographically by prime factorization,
OEIS [A019565](https://oeis.org/A019565):

~~~spl svg=A
0:135.collect { :n |
	n.integerDigits(2)
	.reverse
	.indicesOf(1)
	.prime
	.product
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/indicesOf-A.svg)

* * *

See also: deepIndicesOf, indicesOfSubstring, indexOf, occurrencesOf

Guides: Dictionary Functions, List Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/icapdot),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Position.html)

Categories: Indexing
