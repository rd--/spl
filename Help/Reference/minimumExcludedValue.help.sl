# minimumExcludedValue

- _minimumExcludedValue([x₁ x₂ …], u=0:∞)_

Answer the minimum excluded value of _x_,
often abbreviated _mex_,
the smallest value in _u_ that it not in _x_.

```
>>> [].minimumExcludedValue
0

>>> [1 2 3].minimumExcludedValue
0

>>> [0 2 4 6 8].minimumExcludedValue
1

>>> [0 1 4 7 12].minimumExcludedValue
2
```

With _u_ being the positive integers:

```
>>> let u = 1:Infinity;
>>> [].minimumExcludedValue(u)
1

>>> let u = 1:Infinity;
>>> [1 2 3].minimumExcludedValue(u)
4
```

Two interleaved Beatty sequences,
OEIS [A094077](https://oeis.org/A094077):

~~~spl svg=A oeis=A094077
let u = 1:Infinity;
let a = Map { :n |
	(n = 1).if {
		1
	} {
		n.isEven.if {
			a[n - 1] + n
		} {
			a.minimumExcludedValue(u)
		}
	}
};
a[1:85].scatterPlot
~~~

![](sw/spl/Help/Image/minimumExcludedValue-A.svg)

* * *

See also: detect, includes, Range

Guides: Collection Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Mex.html),
_W_
[1](https://en.wikipedia.org/wiki/Mex_(mathematics))
