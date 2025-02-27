# array

- _array(aBlock, shape)_

Answer an array with the specified _shape_ where each place is defined by _aBlock_,
which must take as many arguments are the `rank` of the array constructed,
that is one for each index.

Generate a 1×10 array:

```
>>> { :x |
>>> 	1 + (x ^ 2)
>>>  }.array([10])
[2 5 10 17 26 37 50 65 82 101]
```

Generate a 3×4 array:

```
>>> { :i :j |
>>> 	10 * i + j
>>>  }.array([3 4])
[
	11 12 13 14;
	21 22 23 24;
	31 32 33 34
]
```

Generate a 3×4×2 array:

```
>>> { :i :j :k |
>>> 	[i j k].fromDigits(10)
>>> }.array([3 4 2])
[
	111 112; 121 122; 131 132; 141 142:;
	211 212; 221 222; 231 232; 241 242:;
	311 312; 321 322; 331 332; 341 342
]
```

Generate a 3×4×2 array by answers a `List` at each place:

```
>>> { :i :j | [i j] }.array([3 4])
[
	1 1; 1 2; 1 3; 1 4:;
	2 1; 2 2; 2 3; 2 4:;
	3 1; 3 2; 3 3; 3 4
]
```

Create a Hilbert matrix:

```
>>> { :i :j |
>>> 	1 / (i + j - 1)
>>> }.array([3 3])
[1 1/2 1/3; 1/2 1/3 1/4; 1/3 1/4 1/5]
```

Lower-triangular matrix:

```
>>> (>).array([5 5]).boole
[
	0 0 0 0 0;
	1 0 0 0 0;
	1 1 0 0 0;
	1 1 1 0 0;
	1 1 1 1 0
]
```

Array of powers:

```
>>> ^.array([5 5])
[
	1    1    1    1    1;
	2    4    8   16   32;
	3    9   27   81  243;
	4   16   64  256 1024;
	5   25  125  625 3125
]
```

Array of arrays:

```
>>> { :i |
>>> 	0.constant.array([i])
>>> }.array([6])
[
	0;
	0 0;
	0 0 0;
	0 0 0 0;
	0 0 0 0 0;
	0 0 0 0 0 0
]
```

A 2×3×4 array:

```
>>> { :i :j :k |
>>> 	i ^ 2 * j * k
>>> }.array([2 3 4])
[
	 1  2  3  4;
	 2  4  6  8;
	 3  6  9 12
	:;
	 4  8 12 16;
	 8 16 24 32;
	12 24 36 48
]
```

Array of `gcd`:

~~~spl svg=A
gcd:/2.array([20 20]).matrixPlot
~~~

![](sw/spl/Help/Image/array-A.svg)

* * *

See also: collect, map, table, tuples

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Array.html)

Categories: Enumerating
