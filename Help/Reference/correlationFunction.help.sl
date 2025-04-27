# correlationFunction

- _correlationFunction(x, h)_

Estimates the correlation function at distances _h_ from data _x_.

Estimate the correlation function for at τ=2:

```
>>> [2 3 4 3].correlationFunction([2])
[-0.5]
```

Estimate the correlation function for at τ=9:

```
>>> [1 .. 10].correlationFunction([9])
[-27/110]
```

Obtain empirical estimates of the correlation function up to τ=9:

```
>>> [1 .. 10].correlationFunction([1 .. 9])
[
	7/10 68/165 49/330 -13/165 -17/66
	-62/165 -131/311 -21/55 -27/110
]
```

Compute the correlation function for τ=1-9 in steps of 2:

```
>>> [1 .. 10].correlationFunction([1, 3 .. 9])
[7/10 49/330 -17/66 -131/311 -27/110]
```

The sum of the sample correlation function is constant:

```
>>> let n = 100;
>>> Sfc32(2678123)
>>> .randomInteger([1 n], [n])
>>> .correlationFunction([1 .. n - 1])
>>> .sum
-0.5
```


let r = Sfc32(126813);
let y = (0 .. 600).collect { :x |
	(2.pi * x / 100).sin
};
let n = r.randomReal([0 10], [601]);
(y + n).scatterPlot


let r = Sfc32(126813);
let y = (0 .. 600).collect { :x |
	(2.pi * x / 100).sin
};
let n = r.randomReal([0 10], [601]);
(y + n).correlationFunction([0 .. 600]).scatterPlot

data = Table[Sin[2 \[Pi] x/100] + 10 Random[], {x, 0, 600}];
ListPlot[data]

let y = ;
let k = y.size;
y.correlationFunction([0 .. 250]).scatterPlot


* * *

See also: absoluteCorrelationFunction, correlation, covariance

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CorrelationFunction.html)
