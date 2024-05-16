# blancmangeFunction

- _blancmangeFunction(anInteger)_

The Blancmange function, also called the Takagi fractal curve,
is a pathological continuous function which is nowhere differentiable.
The _n_-th iteration contains _2^n + 1_ points.

```
>>> 1:4.collect(blancmangeFunction:/1)
[
	0 2 0;
	0 4 4 4 0;
	0 6 8 10 8 10 8 6 0;
	0 8 12 16 16 20 20 20 16 20 20 20 16 16 12 8 0
]
```

Plot ninth iteration:

~~~
9.blancmangeFunction.plot
~~~

* * *

See also: weierstrassFunction

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BlancmangeFunction.html),
_W_
[1](https://en.wikipedia.org/wiki/Blancmange_curve)

Further Reading: Takagi 1901

