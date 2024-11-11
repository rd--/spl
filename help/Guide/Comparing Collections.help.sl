# Comparing Collections

When comparing collections there are two kinds of answers we may wish to get.

The first is another collection giving the answers to comparisons of the respective items:

```
>>> [1, 2, 3] < [4, 5, 6]
[true, true, true]

>>> [1, 3, 5] =.each [-1, 2, 5]
[false, false, true]
```

The second is a comparison of the collections take altogether:

```
>>> [1, 2, 3] precedes: [4, 5, 6]
true

>>> [1, 3, 5] = [-1, 2, 5]
false
```

* * *

See also: =, <, precedes
