# factorialOrGamma

- _x.!_

Answer the `factorial` of the number _x_ if it is a non-negative integer,
else answer `gamma`.

At integral `SmallFloat` and `LargeInteger`:

```
>>> 9.!
362880

>>> 25L.!
15511210043330985984000000L
```

At `Range`:

```
>>> 1:9.!
[1 2 6 24 120 720 5040 40320 362880]
```

Evaluate at real values:

```
>>> 1.5.!
1.32934

>>> (22 / 10).!
2.42397
```

Plot over a subset of the reals:

~~~spl svg=A
(-5 -- 5).functionPlot { :x |
	x.!.clip([-10 10])
}
~~~

![](sw/spl/Help/Image/factorialOrGamma-A.svg)

Plot the volume of the unit hypersphere as a function of dimension:

~~~spl svg=B
(0 -- 25).functionPlot { :n |
	1.pi ^ (n / 2) / (n / 2).!
}
~~~

![](sw/spl/Help/Image/factorialOrGamma-B.svg)

* * *

See also: !, factorial, gamma

Guides: Combinatorial Functions, Special Functions

Categories: Copying
