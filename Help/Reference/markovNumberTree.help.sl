# markovNumberTree

- _markovNumberTree(n)_

Answer the Markov number tree to depth _n_.

The first six levels of the infinite Markov number tree:

```
>>> 6.markovNumberTree
>>> .levelOrderValues
[
	1 1 1;
	1 1 2;
	1 2 5;
	1 5 13;
	2 5 29;
	1 13 34;
	5 13 194;
	2 29 169;
	5 29 433;
	1 34 89;
	13 34 1325;
	5 194 2897;
	13 194 7561;
	2 169 985;
	29 169 14701;
	5 433 6466;
	29 433 37666
]
```

All entries in the Markov tree are Markov numbers:

```
>>> 7.markovNumberTree
>>> .levelOrderValues
>>> .catenate
>>> .allSatisfy(isMarkovNumber:/1)
true
```

Plot the first five levels:

~~~spl svg=A
5.markovNumberTree.treePlot
~~~

![](sw/spl/Help/Image/markovNumberTree-A.svg)

* * *

See also: isMarkovNumber, markovNumber, markovNumberSequence

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MarkovNumber.html),
_OEIS_
[1](https://oeis.org/A002559),
_W_
[1](https://en.wikipedia.org/wiki/Markov_number)
