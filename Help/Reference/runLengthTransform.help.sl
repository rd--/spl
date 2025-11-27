# runLengthTransform

- _runLengthTransform(n, f:/1)_

Answer the run-length transform of the integer sequence given by the unary block _f_.

Run length transform of _S(n)=Fibonacci(n+1)_,
OEIS [A246028](https://oeis.org/A246028):

```
>>> 63.runLengthTransform { :n |
>>> 	(n + 1).fibonacci
>>> }
[
	1 1 1 2 1 1 2 3 1 1 1 2 2 2 3 5 1 1 1 2
	1 1 2 3 2 2 2 4 3 3 5 8 1 1 1 2 1 1 2 3
	1 1 1 2 2 2 3 5 2 2 2 4 2 2 4 6 3 3 3 6
	5 5 8
]
```

Plot:

~~~spl svg=A
200.runLengthTransform { :n |
	(n + 1).fibonacci
}.scatterPlot
~~~

![](sw/spl/Help/Image/runLengthTransform-A.svg)

Run length transform of `primorial`,
OEIS [A278159](https://oeis.org/A278159):

```
>>> 15.runLengthTransform(primorial:/1)
[
	1  2  2  6  2  4  6 30  2  4
	4 12  6 12 30
]
```

Log scale scatter plot:

~~~spl svg=B
100.runLengthTransform(primorial:/1)
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/runLengthTransform-B.svg)

* * *

See also: runLengthsOf

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A246028)
[2](https://oeis.org/A278159)
