# integerCompositionsWeak

_integerCompositionsWeak(n, k)_

A weak composition is an ordered arrangement of _k_ non-negative integers which sum to _n_.

```
>>> 3.integerCompositionsWeak(2)
[0 3; 1 2; 2 1; 3 0]

>>> 3.integerCompositions(2)
[1 2; 2 1]
```

In the weak form _k_ may be greater than _n_:

```
>>> 2.integerCompositionsWeak(3)
[0 0 2; 0 1 1; 0 2 0; 1 0 1; 1 1 0; 2 0 0]
```

4-2 compositions:

```
>>> 4.integerCompositionsWeak(2)
[0 4; 1 3; 2 2; 3 1; 4 0]

>>> 4.integerCompositions(2)
[1 3; 2 2; 3 1]
```

4-3 compositions:

```
>>> 4.integerCompositionsWeak(3)
[0 0 4; 0 1 3; 0 2 2; 0 3 1; 0 4 0; 1 0 3; 1 1 2; 1 2 1; 1 3 0; 2 0 2; 2 1 1; 2 2 0; 3 0 1; 3 1 0; 4 0 0]

>>> 4.integerCompositions(3)
[1 1 2; 1 2 1; 2 1 1]
```

* * *

See also: integerCompositions, integerPartitions
