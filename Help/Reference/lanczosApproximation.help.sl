# lanczosApproximation

- _lanczosApproximation(z)_

Implement the Lanczos approximation for the `gamma` function.

At `one`:

```
>>> 1.lanczosApproximation
1

>>> 1.gamma
1
```

At five:

```
>>> 5.lanczosApproximation
24

>>> 5.gamma
24
```

At one half:

```
>>> 0.5.lanczosApproximation
1.7725

>>> 0.5.gamma
1.7725
```

Compare `gamma` and `lanczosApproximation` for small _z_:

~~~spl svg=A
(0.125 -- 4.125).functionPlot(
	[
		gamma:/1,
		lanczosApproximation:/1
	]
)
~~~

![](sw/spl/Help/Image/lanczosApproximation-A.svg)

* * *

See also: gamma

Guides: Special Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lanczos_approximation)
