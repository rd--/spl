# welchFunction

- _welchFunction(aNumber)_

Answer the Welch window function at _aNumber_.

```
>>> 0.1.welchFunction(1)
0.96
```

Plot:

~~~
(-0.5, -0.49 .. 0.5).welchFunction.plot
~~~

Shape of a Welch window using a specified parameter:

~~~
(-1, -0.99 .. 1).welchFunction(1.2).plot
~~~

Discrete Welch window of length 15:

~~~
(-0.5, -0.5 + (1 / 14) .. 0.5).welchFunction.plot
~~~

* * *

See also: welchWindow, hammingFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WelchApodizationFunction.html)
[2](https://reference.wolfram.com/language/ref/WelchWindow.html)
