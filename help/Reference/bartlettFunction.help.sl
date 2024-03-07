# bartlettFunction

- _bartlettFunction(aNumber)_

Answer the Bartlett window function at _aNumber_.

```
>>> 0.1.bartlettFunction
0.8
```

Plot:

~~~
(-0.5, -0.4 .. 0.5).bartlettFunction.plot
~~~

Discrete Bartlett window of length 15:

~~~
(-0.5, -0.5 + (1 / 14) .. 0.5).bartlettFunction.plot
~~~

* * *

See also: bartlettWindow, hammingFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BartlettFunction.html)
[2](https://reference.wolfram.com/language/ref/BartlettWindow.html)
