# stirlingsApproximation

- _stirlingsApproximation(n)_

Answer Stirlingy’s approximation for the `factorial` function.

Approximation for first few integers:

```
>>> 0:9.collect { :n |
>>> 	[
>>> 		n.factorial,
>>> 		n.stirlingsApproximation
>>> 		.round
>>> 	]
>>> }
[
	1 0;
	1 1;
	2 2;
	6 6;
	24 24;
	120 118;
	720 710;
	5040 4980;
	40320 39902;
	362880 359537
]
```

Plot comparing `factorial` and `stirlingsApproximation` for small _n_:

~~~spl svg=A
(0 -- 3).functionPlot(
	[
		factorial:/1,
		stirlingsApproximation:/1
	]
)
~~~

![](sw/spl/Help/Image/stirlingsApproximation-A.svg)

* * *

See also: !, factorial, gamma, lanczosApproximation

Guides: Integer Functions, Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/StirlingsApproximation.html),
_W_
[1](https://en.wikipedia.org/wiki/Stirling%27s_approximation)
