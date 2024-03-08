# blackmanWindow

- _blackmanWindow(aNumber)_

Answer the _Blackman window_ function at _aNumber_.

```
>>> 0.1.blackmanWindow
0.84923
```

Plot:

~~~
Interval(-0.5, 0.5).discretize(1024, blackmanWindow:/1).plot
~~~

Discrete _Blackman window_ of length 15:

~~~
Interval(-0.5, 0.5).discretize(15, blackmanWindow:/1).plot
~~~

* * *

See also: Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanWindow.html)
