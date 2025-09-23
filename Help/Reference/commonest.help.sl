# commonest

- _commonest([x₁ x₂ …])_

Answer a `List` of the elements that are the most common in the collection _x_.

```
>>> ['b' 'a' 'c' 2 'a' 'b' 1 2].commonest
[2 'a' 'b']

>>> [1 2 2 3 3 3 4].commonest
[3]
```

Find the _mode_ for the heights of the children in a class:

```
>>> [
>>> 	134 143 131 140 145
>>> 	136 131 136 143 136
>>> 	133 145 147 150 150
>>> 	146 137 143 132 142
>>> 	145 136 144 135 141
>>> ].commonest
[136]
```

* * *

See also: Multiset, counts, mean, median, sortedElements

Guides: List Functions, Statistics Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mode.html)
[2](https://reference.wolfram.com/language/ref/Commonest.html),
_W_
[1](https://en.wikipedia.org/wiki/Mode_(statistics))

Categories: Statistics
