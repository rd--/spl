# collatzTerrasTree

- _collatzTerrasTree(k, x=4)_

Answer the Collatz-Terras tree to depth _k_,
beginning at _x_.

The Collatz-Terras tree,
OEIS [A248573](https://oeis.org/A248573):

```
>>> 7.collatzTerrasTree(4)
>>> .levelOrderValues
[
	4 8 5 16 3 10 32 6 20 21
	64 12 13 40 42 128 24 26 80 84
	85 256
]
```

Plot the Collatz-Terras tree:

~~~spl svg=A
5.collatzTerrasTree(4)
.treePlot
~~~

![](Help/Image/collatzTerrasTree-A.svg)

* * *

See also: collatzSequence, collatzTerrasSequence
