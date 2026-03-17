# repeat

- _repeat([x₁ x₂ …], n)_
- _repeat([x₁ x₂ …], n, m)_

Answer a sequence consisting of the sequence _x_ repeated _n_ times.
The ternary form truncates the answer to be of length at most _m_.

At `List`:

```
>>> [1 2 3].repeat(3)
[1 2 3 1 2 3 1 2 3]

>>> [1 2 3].repeat(3, 7)
[1 2 3 1 2 3 1]
```

At `String`,
answer a string consisting of the string _s_ repeated _n_ times.

A `String` of twenty-three copies of the letter _a_:

```
>>> 'a'.repeat(23)
'aaaaaaaaaaaaaaaaaaaaaaa'
```

Repeat a triplet of characters seven times:

```
>>> 'xyz'.repeat(7)
'xyzxyzxyzxyzxyzxyzxyz'
```

Repeat `one`,
the all ones sequence,
OEIS [A000012](http://oeis.org/A000012):

```
>>> [1].repeat(22)
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]

>>> [1].linearRecurrence([1], 22)
[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
```

Repeat `zero`,
the all zeroes sequence,
OEIS [A000004](http://oeis.org/A000004):

```
>>> [0].repeat(22)
[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]

>>> [1].linearRecurrence([0], 22)
[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
```

The _01_ sequence,
the characteristic function of odd numbers,
OEIS [A000035](http://oeis.org/A000035):

```
>>> [0 1].repeat(11)
[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]

>>> [0 1].linearRecurrence([0 1], 22)
[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1]
```

The _10_ sequence,
the characteristic function of even numbers,
OEIS [A059841](https://oeis.org/A059841)

```
>>> [1 0].repeat(11)
[1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]

>>> [0 1].linearRecurrence([1 0], 22)
[1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]
```

The _011_ sequence,
OEIS [A011655](https://oeis.org/A011655)

```
>>> [0 1 1].repeat(7)
[0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1]

>>> [0 0 1].linearRecurrence([0 1 1], 21)
[0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1]
```

The _1100_ sequence,
OEIS [A133872](https://oeis.org/A133872)

```
>>> [1 1 0 0].repeat(5)
[1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0]

>>> [1 -1 1].linearRecurrence([1 1 0], 20)
[1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0]

>>> [1 0 -1 0].repeat(5).prefixSum
[1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0]

>>> [1 2 3 4 6 12 28 64 136 272 528 1024]
>>> .inverseBinomialTransform
[1 1 0 0 1 1 0 0 1 1 0 0]
```

_-1^n_,
the _1,-1_ sequence,
OEIS [A033999](https://oeis.org/A033999):

```
>>> [1 -1].repeat(7)
[1 -1 1 -1 1 -1 1 -1 1 -1 1 -1 1 -1]

>>> [-1].linearRecurrence([1], 14)
[1 -1 1 -1 1 -1 1 -1 1 -1 1 -1 1 -1]
```

_n_ appears _n+1_ times,
OEIS [A003056](https://oeis.org/A003056):

```
>>> 0:5.collect { :n |
>>> 	[n].repeat(n + 1)
>>> }.catenate
[0 1 1 2 2 2 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5]
```

The inverse of sixth cyclotomic polynomial,
OEIS [A010892](https://oeis.org/A010892):

```
>>> [1 1 0 -1 -1 0].repeat(3)
[1 1 0 -1 -1 0 1 1 0 -1 -1 0 1 1 0 -1 -1 0]

>>> [1 -1].linearRecurrence([1 1], 18)
[1 1 0 -1 -1 0 1 1 0 -1 -1 0 1 1 0 -1 -1 0]
```

Repeat _1,-1,0_,
OEIS [A049347](https://oeis.org/A049347):

```
>>> [1 -1 0].repeat(6)
[1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0]

>>> [-1 -1].linearRecurrence([1 -1], 18)
[1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0]
```

Repeat _1,0,-1_,
OEIS [A057078](https://oeis.org/A057078),
partial sums are _110_ repeat:

```
>>> [1 0 -1].repeat(6)
[1 0 -1 1 0 -1 1 0 -1 1 0 -1 1 0 -1 1 0 -1]

>>> [-1 -1].linearRecurrence([1 0], 18)
[1 0 -1 1 0 -1 1 0 -1 1 0 -1 1 0 -1 1 0 -1]

>>> [1 0 -1].repeat(6).prefixSum
[1 1 0 1 1 0 1 1 0 1 1 0 1 1 0 1 1 0]
```

Repeat _1,0,-1,0_,
OEIS [A056594](https://oeis.org/A056594)
partial sums are _1100_ repeat:

```
>>> [1 0 -1 0].repeat(4)
[1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1 0]

>>> [0 -1].linearRecurrence([1 0], 16)
[1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1 0]

>>> [1 0 -1 0].repeat(4).prefixSum
[1 1 0 0 1 1 0 0 1 1 0 0 1 1 0 0]
```

Repeat _1,1,-1,-1_,
OEIS [A057077](https://oeis.org/A057077):

```
>>> [1 1 -1 -1].repeat(4)
[1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1]

>>> [0 -1].linearRecurrence([1 1], 16)
[1 1 -1 -1 1 1 -1 -1 1 1 -1 -1 1 1 -1 -1]
```

Repeat _0,1,0,-1_
OEIS [A101455](https://oeis.org/A101455):

```
>>> [0 1 0 -1].repeat(4)
[0 1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1]

>>> [0 -1].linearRecurrence([0 1], 16)
[0 1 0 -1 0 1 0 -1 0 1 0 -1 0 1 0 -1]
```

Repeat _0,1,-1_
OEIS [A102283](https://oeis.org/A102283):

```
>>> [0 1 -1].repeat(6)
[0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1]

>>> [-1 -1].linearRecurrence([0 1], 18)
[0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1 0 1 -1]
```

Repeat _1,2,1,-1,-2,-1_,
OEIS [A057079](https://oeis.org/A057079):

```
>>> [1 2 1 -1 -2 -1].repeat(3)
[1 2 1 -1 -2 -1 1 2 1 -1 -2 -1 1 2 1 -1 -2 -1]

>>> [1 -1].linearRecurrence([1 2], 18)
[1 2 1 -1 -2 -1 1 2 1 -1 -2 -1 1 2 1 -1 -2 -1]
```

Repeat _0,1,-1,-1,1_,
OEIS [A080891](https://oeis.org/A080891):

```
>>> [0 1 -1 -1 1].repeat(3)
[0 1 -1 -1 1 0 1 -1 -1 1 0 1 -1 -1 1]

>>> [-1 -1 -1 -1].linearRecurrence(
>>> 	[0 1 -1 -1], 15
>>> )
[0 1 -1 -1 1 0 1 -1 -1 1 0 1 -1 -1 1]
```

Repeat _1,1,-2_,
OEIS [A061347](https://oeis.org/A061347):

```
>>> [1 1 -2].repeat(6)
[1 1 -2 1 1 -2 1 1 -2 1 1 -2 1 1 -2 1 1 -2]

>>> [-1 -1].linearRecurrence([1 1], 18)
[1 1 -2 1 1 -2 1 1 -2 1 1 -2 1 1 -2 1 1 -2]
```

Repeat _0,1,0,2_,
OEIS [A131743](https://oeis.org/A131743):

```
>>> [0 1 0 2].repeat(4)
[0 1 0 2 0 1 0 2 0 1 0 2 0 1 0 2]

>>> [0 0 0 1].linearRecurrence(
>>> 	[0 1 0 2], 16
>>> )
[0 1 0 2 0 1 0 2 0 1 0 2 0 1 0 2]
```

Kronecker symbol _m=2_,
OEIS [A091337](https://oeis.org/A091337):

```
>>> [0 1 0 -1 0 -1 0 1].repeat(2)
[0 1 0 -1 0 -1 0 1 0 1 0 -1 0 -1 0 1]

>>> [0 0 0 -1].linearRecurrence(
>>> 	[0 1 0 -1], 16
>>> )
[0 1 0 -1 0 -1 0 1 0 1 0 -1 0 -1 0 1]
```

A Chebyshev transform of the Fibonacci numbers,
OEIS [A100047](https://oeis.org/A100047):

```
>>> [1 1 -1 -1 0 -1 -1 1 1 0].repeat(2)
[
	1 1 -1 -1 0 -1 -1 1 1 0
	1 1 -1 -1 0 -1 -1 1 1 0
]

>>> [1 -1 1 -1].linearRecurrence(
>>> 	[1 1 -1 -1], 20
>>> )
[
	1 1 -1 -1 0 -1 -1 1 1 0
	1 1 -1 -1 0 -1 -1 1 1 0
]
```

A Chebyshev transform of the Fibonacci numbers,
OEIS [A100047](https://oeis.org/A100047):

~~~spl svg=A oeis=A100047
[1 1 -1 -1 0 -1 -1 1 1 0].repeat(9)
.discretePlot
~~~

![](Help/Image/repeat-A.svg)

The _01_ sequence,
discrete plot,
OEIS [A000035](http://oeis.org/A000035):

~~~spl svg=B oeis=A000035
[0 1].repeat(30).discretePlot
~~~

![](Help/Image/repeat-B.svg)

_-1^n_,
the _1,-1_ sequence,
OEIS [A033999](https://oeis.org/A033999):

~~~spl svg=C oeis=A033999
[1 -1].repeat(30).discretePlot
~~~

![](Help/Image/repeat-C.svg)

Characteristic function of numbers that are not multiples of ten,
OEIS [A168184](https://oeis.org/A168184):

~~~spl svg=D oeis=A168184
([1 9] # [0 1]).repeat(5).discretePlot
~~~

![](Help/Image/repeat-D.svg)

* * *

See also: constantArray, findRepeat, stringCatenate, stringJoin, stringRepeat

Guides: List Functions, String Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StringRepeat.html),
_OEIS_
[1](http://oeis.org/A000012)
[2](http://oeis.org/A000035)
