# blackmanHarrisWindow

- _blackmanHarrisWindow(aNumber)_

Answer the _Blackman-Harris window_ function at _aNumber_.

```
>>> 0.1.blackmanHarrisWindow
0.793834
```

Plot:

~~~
Interval(-1, 1).discretize(1024, blackmanHarrisWindow:/1).plot
~~~

Discrete _BlackmanHarris window_ of length 15:

~~~
Interval(-0.5, 0.5).discretize(15, blackmanHarrisWindow:/1).plot
~~~

* * *

See also: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanHarrisFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanHarrisWindow.html)
