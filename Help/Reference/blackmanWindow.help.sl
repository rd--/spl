# blackmanWindow

- _blackmanWindow(aNumber)_

Answer the _Blackman window_ function at _aNumber_.

```
>>> 0.1.blackmanWindow
0.84923
```

Plot:

~~~spl svg=A
(-0.5 -- 0.5).functionPlot(
	blackmanWindow:/1
)
~~~

![](sw/spl/Help/Image/blackmanWindow-A.svg)

Discrete _Blackman window_ of length 15:

~~~spl svg=B
(-0.5 -- 0.5).discretize(
	15,
	blackmanWindow:/1
).discretePlot
~~~

![](sw/spl/Help/Image/blackmanWindow-B.svg)

* * *

See also: bartlettWindow, welchWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanWindow.html)

Categories: Windowing
