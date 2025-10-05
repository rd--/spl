# allButFirstAndLast

- _allButFirstAndLast([x₁ x₂ …], n=1)_

Answer a copy of the sequence _x_ containing all but the first and last _n_ elements.
Signal an error if there are not enough elements.

```
>>> 1:9.allButFirstAndLast(3)
4:6
```

The unary form answers all but the first and last element.

```
>>> 1:9.allButFirstAndLast
2:8

>>> 'cat'.contents.allButFirstAndLast
['a']
```

* * *

See also: allButFirst, allButLast

Guides: List Functions

Categories: Accessing
