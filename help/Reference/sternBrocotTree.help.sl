# sternBrocotTree

- _sternBrocotTree(anInteger)_

Answer the Stern-Brocot `Tree` of depth _anInteger_.

```
>>> 1:4.collect { :n | n.sternBrocotTree.contents.collect(value:/1).sort }
[
	[1/1]
	[1/2 1/1 2/1]
	[1/3 1/2 2/3 1/1 3/2 2/1 3/1]
	[1/4 1/3 2/5 1/2 3/5 2/3 3/4 1/1 4/3 3/2 5/3 2/1 5/2 3/1 4/1]
]

>>> 4.sternBrocotTree.contents.collect(value:/1).sort.collect(numerator:/1)
[1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]

>>> 15.sternBrocotSequence.first(15)
[1 1 2 1 3 2 3 1 4 3 5 2 5 3 4]
```

* * *

See also: calkinWilfTree, mediant, sternBrocotSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Stern-BrocotTree.html)
