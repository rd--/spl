# bartlettWindow

- _bartlettWindow(aNumber)_

Answer the _Bartlett window_ function at _aNumber_.
The _Bartlett window_ is triangular.

```
>>> 0.1.bartlettWindow
0.8
```

Plot:

~~~
(-0.5 -- 0.5).functionPlot(bartlettWindow:/1)
~~~

Discrete _Bartlett window_ of length 15:

~~~
(-0.5 -- 0.5).discretize(15, bartlettWindow:/1).discretePlot
~~~

* * *

See also: blackmanWindow

Guides: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BartlettFunction.html)
[2](https://reference.wolfram.com/language/ref/BartlettWindow.html)

Categories: Windowing
