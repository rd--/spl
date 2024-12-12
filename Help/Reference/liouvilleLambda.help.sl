# liouvilleLambda

- _liouvilleLambda(aNumber)_

Answer the Liouville lambda function at _aNumber_.
The answer is one whenever the number of prime factors counting multiplicity of _aNumber_ is even,
and negative one otherwise.

Compute the Liouville function at 8 and 9:

```
>>> 8.liouvilleLambda
-1

>>> 9.liouvilleLambda
1
```

Plot the Liouville lambda sequence for the first 20 numbers:

~~~
1:20.collect(liouvilleLambda:/1)
.discretePlot
~~~

![](sw/spl/Help/Image/liouvilleLambda-A.svg)

* * *

See also: primeFactors, size

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LiouvilleFunction.html)
[2](https://reference.wolfram.com/language/ref/LiouvilleLambda.html),
_OEIS_
[1](https://oeis.org/A008836),
_W_
[1](https://en.wikipedia.org/wiki/Liouville_function)
