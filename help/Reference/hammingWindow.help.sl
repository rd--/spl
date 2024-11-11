# hammingWindow

- _hammingWindow(aNumber)_

Answer the Hamming window function at _aNumber_.

```
>>> 0.1.hammingWindow
0.912812
```

Plot:

~~~
(-0.5 -- 0.5).functionPlot(hammingWindow:/1)
~~~

Discrete Hamming window of length 15:

~~~
(-0.5 -- 0.5).discretize(15, hammingWindow:/1).discretePlot
~~~

* * *

See also: hammingTable

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammingFunction.html)
[2](https://reference.wolfram.com/language/ref/HammingWindow.html)

Categories: Windowing
