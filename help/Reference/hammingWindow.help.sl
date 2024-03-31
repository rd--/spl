# hammingWindow

- _hammingWindow(aNumber)_

Answer the Hamming window function at _aNumber_.

```
>>> 0.1.hammingWindow
0.912812
```

Plot:

~~~
(-0.5 -- 0.5).discretize(1024, hammingWindow:/1).plot
~~~

Discrete Hamming window of length 15:

~~~
(-0.5 -- 0.5).discretize(15, hammingWindow:/1).plot
~~~

* * *

See also: hammingTable, Window Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HammingFunction.html)
[2](https://reference.wolfram.com/language/ref/HammingWindow.html)
