# hannWindow

- _hannWindow(aNumber)_

Answer the _Hann_ window function at _aNumber_.

```
>>> 0.1.hannWindow(0.5)
0.904508
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	hannWindow:/1
)
~~~

![](sw/spl/Help/Image/hannWindow-A.svg)

Discrete _Hann_ window of length 15:

~~~
(-0.5 -- 0.5).discretize(
	15,
	hannWindow:/1
).discretePlot
~~~

* * *

See also: hammingTable

Guide: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HannningFunction.html)
[2](https://reference.wolfram.com/language/ref/HannWindow.html)

Categories: Windowing
