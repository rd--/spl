# isPerfectPower

- _isPerfectPower(n)_

Answer `true` if the integer _n_ is a perfect power, and `false` otherwise.

The first few perfect powers,
OEIS [A001597](http://oeis.org/A001597):

```
>>> 1:1024.select(isPerfectPower:/1)
[
	  4   8   9  16   25
	 27  32  36  49   64
	 81 100 121 125  128
	144 169 196 216  225
	243 256 289 324  343
	361 400 441 484  512
	529 576 625 676  729
	784 841 900 961 1000
	1024
]
```

Plot distance to nearest perfect power,
OEIS [A301573](https://oeis.org/A301573):

~~~spl svg=A
0:250.collect { :n |
	let k = 0;
	{
		(n + k).isPerfectPower | {
			(n - k).isPerfectPower | {
				(n - k) = 1 | {
					(n + k) = 1
				}
			}
		}
	}.whileFalse {
		k := k + 1
	};
	k
}.scatterPlot
~~~

![](sw/spl/Help/Image/isPerfectPower-A.svg)

* * *

See also: isPerfectSquare

Guides: Integer Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PerfectPower.html)
_OEIS_
[1](http://oeis.org/A001597),
_W_
[1](https://en.wikipedia.org/wiki/Perfect_number)

Categories: Testing, Math
