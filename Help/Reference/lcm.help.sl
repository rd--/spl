# lcm

- _lcm(c)_
- _lcm(m, n)_

Least common multiple,
either of the collection _c_,
or of the two number _m_ and _n_.

```
>>> 0.lcm(9)
0

>>> 4.lcm(6)
12

>>> 1.lcm(1)
1

>>> 1624.lcm(26)
21112
```

At `Collection`:

```
>>> [2 3 5].reduce(lcm:/2)
30

>>> [2 3 5].lcm
30

>>> [3 -5 7].lcm
105

>>> [1/3 2/5 3/7].lcm
6

>>> [5].lcm
5

>>> 1:20.lcm
232792560
```

Lcm threads elementwise over lists:

```
>>> [3 7 40].collect { :each |
>>> 	12.lcm(each)
>>> }
[12 84 120]

>>> [3 7 40].lcm(12)
[12 84 120]

>>> 12.lcm([3 7 40])
[12 84 120]
```

Lcm of first one hundred integers:

```
>>> (1L .. 100L).lcm
69720375229712477164533808935312303556800L
```

Cumulative least common multiples:

```
>>> 1:9.scan(lcm:/2)
[1 2 6 12 60 60 420 840 2520]
```

Signs are discarded:

```
>>> [-3 7].lcm
21
```

For `zero` and `one`, `lcm` is analogous to logical and:

```
>>> lcm:/2.table([0 1], [0 1])
[0 0; 0 1]

>>> &&.table([false true], [false true])
[false false; false true]
```

Plot the least common multiple for a number with 12:

~~~spl svg=A
1:72.functionPlot { :x |
	x.lcm(12)
}
~~~

![](sw/spl/Help/Image/lcm-A.svg)

Visualize the least common multiples of two integers:

~~~spl png=B
{ :m :n |
	lcm(m, n)
}.table(1:50, 1:50).rescale.Greymap
~~~

![](sw/spl/Help/Image/lcm-B.png)

Fibonacci numbers:

~~~spl png=C
let f = 1:100.fibonacciNumber;
let m = f[30];
{ :i :j |
	let a = f[i];
	let b = f[j];
	lcm(a, b) % m
}.table(1:75, 1:75).rescale.Greymap
~~~

![](sw/spl/Help/Image/lcm-C.png)

Form the least common multiples of `one` with rational numbers:

~~~spl svg=D
(1 .. 20).collect { :j |
	(1 .. 2 * j).collect { :i |
		Fraction(i, j)
	}
}.catenate.nub.sort.collect { :n |
	lcm(1, n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/lcm-D.svg)

* * *

See also: &&, extendedGcd, gcd, Gcd, Lcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/LCM),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lcm),
_Mathematica_
[1](https://mathworld.wolfram.com/LeastCommonMultiple.html)
[2](https://https://reference.wolfram.com/language/ref/LCM.html),
_Smalltalk_
5.6.5.14,
_W_
[1](https://en.wikipedia.org/wiki/Least_common_multiple)
