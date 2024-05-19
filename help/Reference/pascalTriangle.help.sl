# pascalTriangle

- _pascalTriangle(anInteger)_

Answer the first _anInteger_ rows of Pascal’s triangle.

The first eleven rows:

```
>>> 11.pascalTriangle
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1;
	1 6 15 20 15 6 1;
	1 7 21 35 35 21 7 1;
	1 8 28 56 70 56 28 8 1;
	1 9 36 84 126 126 84 36 9 1;
	1 10 45 120 210 252 210 120 45 10 1;
	1 11 55 165 330 462 462 330 165 55 11 1
]
```

A `log` scaled scatter plot of the row-order sequence,
c.f. OEIS [A007318](https://oeis.org/A007318):

~~~
50.pascalTriangle.concatenation.log.scatterPlot
~~~

* * *

See also: binomial, table
