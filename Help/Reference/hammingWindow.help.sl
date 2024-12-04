# hammingWindow

- _hammingWindow(aNumber)_

Answer the Hamming window function at _aNumber_.

```
>>> 0.1.hammingWindow
0.912812
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(hammingWindow:/1)
~~~

![](sw/spl/Help/Image/hammingWindow-A.svg)

Discrete Hamming window of length 15:

~~~
(-0.5 -- 0.5).discretize(
	15,
	hammingWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/hammingWindow-B.svg)

* * *

See also: hammingTable, hannWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammingFunction.html)
[2](https://reference.wolfram.com/language/ref/HammingWindow.html)

Categories: Windowing
