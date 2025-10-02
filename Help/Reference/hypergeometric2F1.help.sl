# hypergeometric2F1

- _hypergeometric2F1(a, b, c, z)_

Answer the hypergeometric function _₂F₁(a,b;c;z)_.

At `SmallFloat`:

```
>>> let [a, b, c] = [1 / 2, 1 / 3, 2];
>>> let z = 1;
>>> hypergeometric2F1(a, b, c, z)
1.159594

>>> let [a, b, c] = [2, 3, 4];
>>> let z = 1 / 2;
>>> hypergeometric2F1(a, b, c, z)
2.728935
```

At `Complex`:

```
>>> let [a, b, c] = [2J1, 0J-1, 3 / 4];
>>> let z = 0.5J-0.5;
>>> hypergeometric2F1(a, b, c, z)
-0.972167J-0.181659
```

Plot varying _z_ over a subset of the reals:

~~~spl svg=A
let [a, b, c] = [1 / 3, 1 / 3, 2 / 3];
(-1 -- 1).functionPlot { :z |
	hypergeometric2F1(
		a, b, c, z
	).clip([0 1.5])
}
~~~

![](sw/spl/Help/Image/hypergeometric2F1-A.svg)

Plot varying _z_ for three distinct _c_:

~~~spl svg=B
(-1 -- 1).functionPlot(
	[2 3 5].collect { :n |
		{ :z |
			hypergeometric2F1(
				1, 0.5, n.sqrt, z
			).clip([0 2])
		}
	}
)
~~~

![](sw/spl/Help/Image/hypergeometric2F1-B.svg)

* * *

See also: beta, legendreP, pochhammer

Guides: Special Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HypergeometricFunction.html)
[2](https://reference.wolframcloud.com/language/ref/Hypergeometric2F1.html)
_W_
[1](https://en.wikipedia.org/wiki/Hypergeometric_function)
