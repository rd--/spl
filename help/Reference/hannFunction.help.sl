# hannFunction

- _hannFunction(aNumber)_

Answer the Hann window function at _aNumber_.

```
>>> 0.1.hannFunction(0.5)
0.904508
```

Plot:

~~~
(-0.5, -0.49 .. 0.5).hannFunction.plot
~~~

Discrete Hann window of length 15:

~~~
(-0.5, -0.5 + (1 / 14) .. 0.5).hannFunction.plot
~~~

* * *

See also: hammingFunction, hannWindow

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HannningFunction.html)
[2](https://reference.wolfram.com/language/ref/HannWindow.html)
