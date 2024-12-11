# unitize

- _unitize(x)_
- _unitize(x, dx)_

Answer `zero` when _x_ is `zero`, and `one` when _x_ has any other numerical value.
In the binary case _dx_, answer `zero` for any _x_ with magnitude less than _dx_.

Convert numerical values to zero or one:

```
>>> pi.unitize
1
```

With `epsilon`:

```
>>> (2.sqrt + 3.sqrt - (5 + (2 * 6.sqrt)).sqrt)
>>> .unitize(1.epsilon)
0
```

Replace values in a matrix with zeros or ones:

```
>>> [-2 1 0 1; 1 -2 1 0; 0 1 -2 1; 1 0 -2 1]
>>> .unitize
[
	1 1 0 1;
	1 1 1 0;
	0 1 1 1;
	1 0 1 1
]
```

* * *

See also: boole, clip, diracDelta, kroneckerDelta, sign

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Unitize.html)
