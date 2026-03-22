# deBruijnSequence

- _deBruijnSequence([x₁ x₂ …], n)_

Answer a de Bruijn sequence on the elements _x_ taken _n_ at a time.

A de Bruijn sequence of order two on the list _0,1_,
OEIS [A021913](https://oeis.org/A021913):

```
>>> [0 1].deBruijnSequence(2)
[0 0 1 1]

>>> 2 ^ 2
4
```

A de Bruijn sequence of order three,
OEIS [A169675](https://oeis.org/A169675):

```
>>> [0 1].deBruijnSequence(3)
[0 0 0 1 0 1 1 1]

>>> 2 ^ 3
8
```

A de Bruijn sequence of order four,
OEIS [A080679](https://oeis.org/A080679):

```
>>> [0 1].deBruijnSequence(4)
[0 0 0 0 1 0 0 1 1 0 1 0 1 1 1 1]

>>> 2 ^ 4
16
```

A de Bruijn sequence of order five,
OEIS [A169672](https://oeis.org/A169672):

```
>>> [0 1].deBruijnSequence(5)
[
	0 0 0 0 0 1 0 0 0 1
	1 0 0 1 0 1 0 0 1 1
	1 0 1 0 1 1 0 1 1 1
	1 1
]

>>> 2 ^ 5
32
```

A de Bruijn sequence of order six,
OEIS [A169671](https://oeis.org/A169671):

```
>>> [0 1].deBruijnSequence(6)
[
	0 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 1 0 1 0
	0 0 1 1 1 0 0 1 0 0 1 0 1 1 0 0 1 1 0 1
	0 0 1 1 1 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1
	1 1 1 1
]

>>> 2 ^ 6
64
```

A de Bruijn sequence of order seven,
OEIS [A169673](https://oeis.org/A169673):

```
>>> [0 1].deBruijnSequence(7)
[
	0 0 0 0 0 0 0 1 0 0 0 0 0 1 1 0 0 0 0 1
	0 1 0 0 0 0 1 1 1 0 0 0 1 0 0 1 0 0 0 1
	0 1 1 0 0 0 1 1 0 1 0 0 0 1 1 1 1 0 0 1
	0 0 1 1 0 0 1 0 1 0 1 0 0 1 0 1 1 1 0 0
	1 1 0 1 1 0 0 1 1 1 0 1 0 0 1 1 1 1 1 0
	1 0 1 0 1 1 0 1 0 1 1 1 1 0 1 1 0 1 1 1
	0 1 1 1 1 1 1 1
]

>>> 2 ^ 7
128
```

A de Bruijn sequence of order eight,
OEIS [A169674](https://oeis.org/A169674):

```
>>> [0 1].deBruijnSequence(8)
[
	0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 0
	0 0 1 0 1 0 0 0 0 0 1 1 1 0 0 0 0 1 0 0
	1 0 0 0 0 1 0 1 1 0 0 0 0 1 1 0 1 0 0 0
	0 1 1 1 1 0 0 0 1 0 0 0 1 0 0 1 1 0 0 0
	1 0 1 0 1 0 0 0 1 0 1 1 1 0 0 0 1 1 0 0
	1 0 0 0 1 1 0 1 1 0 0 0 1 1 1 0 1 0 0 0
	1 1 1 1 1 0 0 1 0 0 1 0 1 0 0 1 0 0 1 1
	1 0 0 1 0 1 0 1 1 0 0 1 0 1 1 0 1 0 0 1
	0 1 1 1 1 0 0 1 1 0 0 1 1 0 1 0 1 0 0 1
	1 0 1 1 1 0 0 1 1 1 0 1 1 0 0 1 1 1 1 0
	1 0 0 1 1 1 1 1 1 0 1 0 1 0 1 0 1 1 1 0
	1 0 1 1 0 1 1 0 1 0 1 1 1 1 1 0 1 1 0 1
	1 1 1 0 1 1 1 0 1 1 1 1 1 1 1 1
]

>>> 2 ^ 8
256
```

A de Bruijn sequence on the elements _0,1,2_,
OEIS [A169676](https://oeis.org/A169676):

```
>>> [0 1 2].deBruijnSequence(2)
[0 0 1 0 2 1 1 2 2]

>>> 3 ^ 2
9
```

A de Bruijn sequence on the elements _0,1,2,3_:

```
>>> [0 1 2 3].deBruijnSequence(2)
[0 0 1 0 2 0 3 1 1 2 1 3 2 2 3 3]

>>> 4 ^ 2
16
```

A de Bruijn sequence on a string:

```
>>> 'abcd'.deBruijnSequence(2)
'aabacadbbcbdccdd'

>>> 4 ^ 2
16
```

A de Bruijn sequence of order 1 on a list is the list itself:

```
>>> [1 2 3].deBruijnSequence(1)
[1 2 3]

>>> 3 ^ 1
3
```

The ordering of the input list determines the ordering of the de Bruijn sequence:

```
>>> [2 3 1; 3 1 2].collect { :each |
>>> 	each.deBruijnSequence(2)
>>> }
[
	2 2 3 2 1 3 3 1 1;
	3 3 1 3 2 1 1 2 2
]

>>> 3 ^ 2
9
```

The length of a de Bruijn sequence is _k ^ n_:

```
>>> let k = 4;
>>> let n = 3;
>>> [1 .. k].deBruijnSequence(n).size
(k ^ n)
```

The subsequences of length _n_ in a de Bruijn sequence form all possible _n_-tuples on the elements _1:k_:

```
>>> let k = 3;
>>> let n = 2;
>>> let d = [1 .. k].deBruijnSequence(n);
>>> let p = (d ++ [d.first]).partition(n, 1);
>>> let t = 1:k.tuples(n);
>>> (p, t, p.sorted(precedes:/2) = t)
(
	[
		1 1; 1 2; 2 1; 1 3; 3 2;
		2 2; 2 3; 3 3; 3 1
	],
	[
		1 1; 1 2; 1 3; 2 1; 2 2;
		2 3; 3 1; 3 2; 3 3
	],
	true
)
```

Construct a binary de Bruijn sequence of order four,
and show relation to `lyndonWords`:

```
>>> [0 1].deBruijnSequence(4)
[0 0 0 0 1 0 0 1 1 0 1 0 1 1 1 1]

>>> [0 1].lyndonWords(4).select { :x |
>>> 	4.divisible(x.size)
>>> }
[0; 0 0 0 1; 0 0 1 1; 0 1; 0 1 1 1; 1]
```

Use `shiftRegisterSequence` to generate a binary de Bruijn sequence:

```
>>> let i = [0 1 1 1];
>>> let t = [1 2];
>>> let n = 2 ^ 4 - 1;
>>> [0] ++ shiftRegisterSequence(i, t, n)
[0 1].deBruijnSequence(4)
```

A de Bruijn sequence of order two on the list _0,1_,
OEIS [A021913](https://oeis.org/A021913):

~~~spl svg=A oeis=A021913
[0 1].deBruijnSequence(2).repeat(16)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-A.svg)

A de Bruijn sequence of order three,
OEIS [A169675](https://oeis.org/A169675):

~~~spl svg=B oeis=A169675
[0 1].deBruijnSequence(3).repeat(8)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-B.svg)

A de Bruijn sequence of order four,
OEIS [A080679](https://oeis.org/A080679):

~~~spl svg=C oeis=A080679
[0 1].deBruijnSequence(4).repeat(4)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-C.svg)

A de Bruijn sequence of order five,
OEIS [A169672](https://oeis.org/A169672):

~~~spl svg=D oeis=A169672
[0 1].deBruijnSequence(5).repeat(2)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-D.svg)

A de Bruijn sequence of order six,
OEIS [A169671](https://oeis.org/A169671):

~~~spl svg=E oeis=A169671
[0 1].deBruijnSequence(6)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-E.svg)

A de Bruijn sequence of order seven,
OEIS [A169673](https://oeis.org/A169673):

~~~spl svg=F oeis=A169673
[0 1].deBruijnSequence(7)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-F.svg)

A de Bruijn sequence of order eight,
OEIS [A169674](https://oeis.org/A169674):

~~~spl svg=G oeis=A169674
[0 1].deBruijnSequence(8)
.discretePlot
~~~

![](Help/Image/deBruijnSequence-G.svg)

A de Bruijn sequence on the elements _0,1,2_,
OEIS [A169676](https://oeis.org/A169676):

~~~spl svg=H oeis=A169676
[0 1 2].deBruijnSequence(2).repeat(7)
.stepPlot
~~~

![](Help/Image/deBruijnSequence-H.svg)

* * *

See also: deBruijnSequenceCount, isDeBruijnSequence, partition, shiftRegisterSequence, tuples

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/deBruijnSequence.html)
[2](https://reference.wolfram.com/language/ref/DeBruijnSequence.html),
_W_
[1](https://en.wikipedia.org/wiki/De_Bruijn_sequence)

Categories: Math, Sequence
