# blackmanFunction

- _blackmanFunction(aNumber)_

Answer the Blackman window function at _aNumber_.

```
>>> 0.1.blackmanFunction
0.84923
```

Plot:

~~~
(-0.5, -0.49 .. 0.5).blackmanFunction.plot
~~~

Discrete Blackman window of length 15:

~~~
(-0.5, -0.5 + (1 / 14) .. 0.5).blackmanFunction.plot
~~~

* * *

See also: blackmanWindow, hammingFunction, hannFunction, welchFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlackmanFunction.html)
[2](https://reference.wolfram.com/language/ref/BlackmanWindow.html)
